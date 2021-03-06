yosys -import
set SCL scl_trim.lib
# reading and elaborating the RTL
read_verilog test4.v
hierarchy -check
# generic RTL synthesis and optimization
synth -top data_memory
# flattening the resultant generic gate level netlist
flatten; opt
# Technology mapping to Sky130 SCL
dfflibmap -liberty $SCL
abc -D 1250 -constr abc_constr.txt -liberty $SCL
# Clean up and write the synthesized design (gate-level netlist)
opt_clean -purge
write_verilog -noattr -noexpr test4.gl.v
# Report design statistics
stat -liberty $SCL
# exit yosys
exit
