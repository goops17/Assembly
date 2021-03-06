#inverse-triangle.asm 
# Written by: Gopal Chitaure (gochit01@wsc.edu)
# Nested loop concept
#Printing triangle pattern
	#####
	####
	###
	##
	#
.data
	star: .asciiz "#"
	new_line: .asciiz "\n"
.text
main:
	
	li $s0, 5
	jal loop_outer
	loop_outer: 
		li $s1, 0	
		ble $s0, 0, exit_outer
		loop_inner:
			bge $s1, $s0, exit_inner
		
			#print stars
			li $v0, 4
			la $a0, star
			syscall
		
			addi $s1, $s1, 1 #increament counter
			j loop_inner
		exit_inner:
			subi $s0, $s0, 1 #increament counter
			#print stars
			li $v0, 4
			la $a0, new_line
			syscall
			
			j loop_outer
		
	exit_outer: 
	li $v0, 10
	syscall
