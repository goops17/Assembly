# Written by: Gopal Chitaure (gochit01@wsc.edu)
.data 
	messageR: .asciiz  "\nThe Angular Resolution is: "
	messageDeg: .asciiz " degree & "
	messageArc: .asciiz  " arcminutes\n"

	rTd: .double 57.3
	dTa: .double 60
	const: .double 1.22 		
	D: .double 100
	L: .double 0.21
		

.text 
l.d $f0, D 	
l.d $f4, L		
l.d $f8, const	
l.d $f6, rTd
l.d $f10, dTa
l.d $f12, ($at) 
l.d $f14, ($at)	
l.d $f16, ($at) 
l.d $f18, ($at) 
	main:
		
		#Calling function and passing values for degree
		mov.d $f14, $f0
		mov.d $f16, $f4
		jal arDeg
		
		#Printing message
		li $v0, 4
		la $a0, messageR
		syscall
		
		li $v0, 3
		syscall
		
		#Printing unit
		li $v0, 4
		la $a0, messageDeg
		syscall
		
		#Calling function and passing values for arch
		mov.d $f14, $f0
		mov.d $f16, $f4
		jal arArc
		
		
		li $v0, 3
		syscall
		
		#Printing unit
		li $v0, 4
		la $a0, messageArc
		syscall
		
		
		
		
	li $v0, 10
	syscall

	arDeg:
		div.d $f12,$f16, $f14	
		mul.d $f12, $f12, $f8	
		mul.d $f12, $f12, $f6
		jr $ra
	arArc:
		div.d $f12,$f16, $f14	
		mul.d $f12, $f12, $f8	
		mul.d $f12, $f12, $f6
		mul.d $f12, $f12, $f10
		jr $ra
