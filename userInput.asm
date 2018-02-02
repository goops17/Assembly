#userInput.asm 
.data 
B: .asciiz "\nEnter B: " 
Ch: .asciiz "\nEnter Ch: " 
answer: .asciiz "\n\n SA = 2B + Ch is " 

.text 
#printing B
main: li $v0, 4  
la $a0, B 
syscall 

#taking B from user
li $v0, 5 
syscall 
add $s0, $v0, $zero  

#Printing Ch
li $v0, 4 
la $a0, Ch  
syscall 

#taking Ch from user
li $v0, 5 
syscall 
add $s1, $v0, $zero

#Calculating 2B
add $s0, $s0, $s0 #2B = B+B or 2*B

#Calculating 2B+Ch
add $t0, $s1, $s0
 
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

#Reference https://www.physicsforums.com/threads/mips-user-input-as-output.596262/
