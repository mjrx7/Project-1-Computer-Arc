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
	lui $t1, 0x1000
	
	addi $t7,$t7,6		# Break constant for j
	addi $s0,$s0,4		# Break constant for i
	addi $t1, $t1, 0x30	# track address location
	addi $t2, $t2, 0	# track initial register to load at beginning of loop

outerLoop:
	beq $t3, $t7, spin	# if j = 6 jump to spin
	addi $t3,$t3,1		# j++
	xor $t4, $t4, $t4	# Make i = 0 for next run
	xor $t5,$t5,$t5		# Zero out sum register for next set
		
innerLoop:
	beq $t5,$s0,shift	# if i = 4 jump to shift
	addi $t5,$t5,1		# i++
	lw $t6, 0($t0)		# Uses t6 register to load a specific memory address
	addi $t0,$t0,4		# increment t0 by 4 to grab next address on next loop
	add $t4,$t4,$t6		# adds student id digit's together
	j innerLoop				# jumps back to beginning of loop
	
shift:
	srl $t4, $t4, 2		# divide by 4
	sw $t4, 0($t1)		# stores it in memory location $t1 points to
	addi $t1, $t1, 4	# adds 4 to memory location for next run on $t1
	addi $t2, $t2, 4	# adds 4 t0 $t2
	lui $t0, 0x1000		# reset t0 back to inital memory location
	add $t0, $t0, $t2	# add $t2 to memory location
	j outerLoop			# jump back to beginning of big loop

spin:	j spin  #This instruction will "trap" the processor and give it something to execute after your instructions are finished