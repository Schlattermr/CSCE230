vsim thunderbird_fsm

view wave

# view input signals 
add wave i_clk
add wave i_reset
add wave i_left
add wave i_right

# view output signals
add wave o_lights_L
add wave o_lights_R

# view other signals
add wave cs
add wave ns

# set input signal values
force i_clk 1 0, 0 10000 -repeat 20000
force i_reset 1 0, 0 20000, 1 326000, 0 330000, 1 452138
force i_left 0 0, 1 120000, 0 160000, 1 280000, 0 320000, 1 360000
force i_right 0 0, 1 40000, 0 80000, 1 200000, 0 240000, 1 360000

#run simulation
run 500000
