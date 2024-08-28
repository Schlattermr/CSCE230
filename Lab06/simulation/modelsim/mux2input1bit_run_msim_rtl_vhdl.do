transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/mryan/Desktop/CSCE230/Lab06/mux2input1bit.vhd}

do "C:/Users/mryan/Desktop/CSCE230/Lab06/task.do"
