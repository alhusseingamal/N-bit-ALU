vsim -gui work.partb 
add wave -position insertpoint sim:/partb/*
force -freeze sim:/partb/A 16'hf000 0
force -freeze sim:/partb/B 16'h00b0 0
force -freeze sim:/partb/sel 4'b0100 0
run
force -freeze sim:/partb/B 16'h000b 0
force -freeze sim:/partb/sel 4'b0101 0
run
force -freeze sim:/partb/B 16'hb000 0
force -freeze sim:/partb/sel 4'b0110 0
run
force -freeze sim:/partb/sel 4'b0111 0
run
