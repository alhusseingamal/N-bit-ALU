vsim -gui work.partd
add wave -position insertpoint sim:/partd/*
force -freeze sim:/partd/A 16'h000F 0
force -freeze sim:/partd/sel 1100 0
force -freeze sim:/partd/Cin '-' 0
run
force -freeze sim:/partd/sel 1101 0
force -freeze sim:/partd/A 16'h0F0F 0
run
force -freeze sim:/partd/sel 1110 0
force -freeze sim:/partd/Cin 0 0
run
force -freeze sim:/partd/sel 1111 0
force -freeze sim:/partd/Cin '-' 0
force -freeze sim:/partd/A 16'hF000 0
run
force -freeze sim:/partd/Cin 1 0
force -freeze sim:/partd/sel 1110 0
force -freeze sim:/partd/A 16'h0F00 0
run
