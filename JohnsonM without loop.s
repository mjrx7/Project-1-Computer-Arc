#Project 1 Framework, Matthew Johnson

#const:
.data 0x10000000 #This assembler directive tells the assembler to put the data at the beginning of the user data segment
.word 1, 1, 3, 4, 0, 7, 3, 0, 4 #This is my ID number, you should use yours

.text 0x00400000 #This assembler directive tells the assembler to put your code at the beginning of the user text segment

#
#	1:1-4,2:2-5,3:3-6,4:4-7,5:5-8,6:6-9
#

main:
	lui $t0, 0x1000
	
	#1-4
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	lw $t4, 12($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x30($t0)
	
	#2-5
	lw $t1, 4($t0)
	lw $t2, 8($t0)
	lw $t3, 12($t0)
	lw $t4, 16($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x34($t0)
	
	#3-6
	lw $t1, 8($t0)
	lw $t2, 12($t0)
	lw $t3, 16($t0)
	lw $t4, 20($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x38($t0)
	
	#4-7
	lw $t1, 12($t0)
	lw $t2, 16($t0)
	lw $t3, 20($t0)
	lw $t4, 24($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x3C($t0)
	
	#5-8
	lw $t1, 16($t0)
	lw $t2, 20($t0)
	lw $t3, 24($t0)
	lw $t4, 28($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x40($t0)
	
	#6-9
	lw $t1, 20($t0)
	lw $t2, 24($t0)
	lw $t3, 28($t0)
	lw $t4, 32($t0)
	xor $t5, $t5, $t5
	add $t5, $t5,$t1
	add $t5, $t5,$t2
	add $t5, $t5,$t3
	add $t5, $t5,$t4
	srl $t5, $t5, 2
	sw $t5, 0x44($t0)

spin:	j spin  #This instruction will "trap" the processor and give it something to execute after your instructions are finished