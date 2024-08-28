#the name must be the same as your vhdl filename
vsim mux2input1bit

#view waveform
view wave

#view input signals
add wave a
add wave b
add wave s

#view output signal
add wave output

#set input signal values
force a 0 0, 1 10 -repeat 20
force b 0 0, 1 20 -repeat 40
force s 0 0, 1 40 -repeat 80

#run simulation
run 80
