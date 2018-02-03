#inverse-triangle.asm 
# Written by: Gopal Chitaure (gochit01@wsc.edu)
# Nested loop concept
#Printing pyramid pattern
    #
   ###
  #####
 #######
#########
.data
	star: .asciiz "*"
	new_line: .asciiz "\n"
	dot: .asciiz " "
.text
main:
	
	li $s0, 1
	li $s2, 5
	li $s3, 5
	jal loop_outer
	loop_outer: 
		li $s1, 0	
		bgt $s0, 6, exit_outer
		loop_inner:
			bgt $s1, 10, exit_inner
			blt  $s1, $s3, print_space
			bgt  $s1, $s2, print_space
				#print space
				li $v0, 4
				la $a0, star
				syscall
				addi $s1, $s1, 1 #increament counter
				j loop_inner
			print_space:
				li $v0, 4
				#move $a0, $s1
				la $a0, dot
				syscall
				addi $s1, $s1, 1 #increament counter
				j loop_inner
			
		exit_inner:
			addi $s0, $s0, 1 #increament counter
			addi $s2, $s2, 1
			subi $s3, $s3, 1
			#print stars
			li $v0, 4
			la $a0, new_line
			syscall
			
			j loop_outer
		
	exit_outer: 
	li $v0, 10
	syscall
