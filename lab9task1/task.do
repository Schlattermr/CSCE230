vsim RegisterFile16by4Bit

view wave

add wave clock
add wave reset
add wave RF_write
add wave AddressA
add wave AddressB
add wave AddressC
add wave InputC
add wave r_input1
add wave r_input2
add wave r_input3
add wave r_input4
add wave r_input8

add wave OutputA
add wave OutputB

force clock 1 0, 0 10 -repeat 20

# reset between 0 and 10
force reset 1 0, 0 10   

# write from time 0
force RF_write 1 0      
force AddressA 0001 0
force AddressB 0010 0
force AddressC 0001 0, 0010 25, 0011 45, 0100 65, 0011 85, 0100 105
force InputC   0001 0, 0010 25, 0011 45, 0100 65, 1011 85, 1100 105

# read from time 125
force RF_write 0 125   
force AddressA 0001 125, 0011 145 
force AddressB 0010 125, 0100 145
force AddressC 0001 125
force InputC   1001 125

# reset from time 165
force reset 1 165      
force AddressA 0001 165
force AddressB 0010 165
force AddressC 0000 165
force InputC   0000 165

run 180


