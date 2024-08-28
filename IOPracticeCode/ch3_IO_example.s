    .text                   # the code section
    .global _start
_start:
	# Load Toggle Switches
	movia r2, 0xFF200040
	ldw r3, (r2)
	# Load Push-Button Switches
	movia r2, 0xFF200050
	ldw r3, (r2)
	# Red LEDs
	movia r2, 0xFF200000	 
	movia r3, 0x000003FF	# Turn on all 10 Red LEDs
	stw r3, (r2)
	# Seven Segment Display
	movia r2, 0xFF200020
	movia r3, 0x5B3F5B4F	# Displays 2023 on Seven Segment Displays
	stw r3, (r2)
	movia r2, 0xFF200030
	movia r3, 0x3979		# Displays CE on Seven Segment Displays
	stw r3, (r2)

end:br      end
	.data                  	# the data section
    .end                   	# end of the program
