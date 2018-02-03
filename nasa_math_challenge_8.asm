# division.asm 
# Written by: Gopal Chitaure (gochit01@wsc.edu)
# Solution to NASA Math Challenge Question 8
# Challenge/Question link: https://eclipse2017.nasa.gov/challenge-8-%E2%80%93-exploring-angular-diameter
# Concepts used: Output, Floating number arithmatics, functions/passing values--maybe
.data 
	messageSun: .asciiz  "\nProblem 1: The angluar distance of SUN is : "
	messageMoon: .asciiz  "\nProblem 2: The angluar distance of MOON is : "
	messageMoon2: .asciiz  "\nProblem 3: The angluar distance of MOON is : "
	messageUnit: .asciiz  " arcseconds\n"
	#initilizing the values
	sTe: .double 151384000.0	#Sun to Earth distance
	mTe: .double 365600.0		#Moon to Earth distance
	mTe2: .double 377700.0		#Diameter of Sun
	sD: .double 1392600.0		#Diameter of Moon
	mD: .double 3474.0		#Constant
	const: .double 206265 		#Moon to Earth second
		

.text 
#lw $s0, messageSun
#lw $s1, messageMoon
l.d $f0, sTe 	
l.d $f2, mTe	
l.d $f4, sD	
l.d $f6, mD	
l.d $f8, const	
l.d $f20, mTe2	
l.d $f12, ($at) #Angular Diameter
l.d $f14, ($at)	#Argument--distance
l.d $f16, ($at) #Argument--diameter
l.d $f18, ($at) #For printing
	main:
		#SUN SUN SUN
		#Calling function and passing values for SUN
		mov.d $f14, $f0
		mov.d $f16, $f4
		jal angluarDiameter
		
		#Printing message
		li $v0, 4
		la $a0, messageSun
		syscall
		
		#Printing Angluar Diameter
		li $v0, 3
		mov.d $f18, $f6
		syscall
		
		#Printing unit
		li $v0, 4
		la $a0, messageUnit
		syscall
		
		#MOON MOON MOON
		#Calling function and passing values for MOON
		mov.d $f14, $f2
		mov.d $f16, $f6
		jal angluarDiameter
		
		#Printing message
		li $v0, 4
		la $a0, messageMoon
		syscall
		
		#Printing Angluar Diameter
		li $v0, 3
		mov.d $f18, $f6
		syscall
		
		#Printing unit
		li $v0, 4
		la $a0, messageUnit
		syscall
		
		#MOON2 MOON2 MOON2
		#Calling function and passing values for MOON
		mov.d $f14, $f20
		mov.d $f16, $f6
		jal angluarDiameter
		
		#Printing message
		li $v0, 4
		la $a0, messageMoon2
		syscall
		
		#Printing Angluar Diameter
		li $v0, 3
		mov.d $f18, $f6
		syscall
		
		#Printing unit
		li $v0, 4
		la $a0, messageUnit
		syscall
		
	li $v0, 10
	#move $f5, $f5
	syscall
	#function to calculate Angluar Diameter
	# Angle = 206265*(Diameter(km)/distance(km))
	angluarDiameter:
		div.d $f12,$f16, $f14	#diameter/distance
		mul.d $f12, $f12, $f8	#const*(diameter/distance)
		jr $ra


