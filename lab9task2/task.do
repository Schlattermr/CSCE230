vsim ALU

view wave

add wave A
add wave B
add wave ALU_op
add wave A_inv
add wave B_inv
add wave C_in

add wave ALU_out
add wave N
add wave C
add wave V
add wave Z

# test all possible operations
force A 0110 0
force B 0011 0
force ALU_op(0) 0 0, 1 10 -repeat 20 
force ALU_op(1) 0 0, 1 20 -repeat 40 
force A_inv 0 0, 1 40 -repeat 80 
force B_inv 0 0, 1 80 
force C_in 0 0, 1 115, 0 120 

run 160


