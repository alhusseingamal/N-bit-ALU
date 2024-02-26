vsim -gui work.partc
add wave -position insertpoint sim:/partc/*
force -freeze sim:/partc/A 16'hA00A 0
force -freeze sim:/partc/sel 1000 0
force -freeze sim:/partc/Cin '-' 0
run
force -freeze sim:/partc/A 16'h000A 0
run
force -freeze sim:/partc/sel 1001 0
force -freeze sim:/partc/A 16'hB00C 0
run
force -freeze sim:/partc/A 16'h000C 0
run
force -freeze sim:/partc/sel 1010 0
force -freeze sim:/partc/Cin 0 0
force -freeze sim:/partc/A 16'hA00A 0
run
force -freeze sim:/partc/Cin 1 0
run
force -freeze sim:/partc/Cin '-' 0
force -freeze sim:/partc/sel 1011 0
force -freeze sim:/partc/A 16'hA00A 0
run