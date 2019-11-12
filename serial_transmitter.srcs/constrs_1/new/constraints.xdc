# Constraints File

# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# Buttons
set_property PACKAGE_PIN U18 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnc]

# switches
set_property PACKAGE_PIN V17 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]
set_property PACKAGE_PIN V16 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]
set_property PACKAGE_PIN W16 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]
set_property PACKAGE_PIN W17 [get_ports sw[3]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]
set_property PACKAGE_PIN W15 [get_ports sw[4]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[4]]
set_property PACKAGE_PIN V15 [get_ports sw[5]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[5]]
set_property PACKAGE_PIN W14 [get_ports sw[6]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]]
set_property PACKAGE_PIN W13 [get_ports sw[7]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]]

# Serial Output
set_property PACKAGE_PIN A18 [get_ports jtag_rx]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_rx]

# Seven Segment Anodes
set_property PACKAGE_PIN U2 [get_ports anode_out[0]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[0]]
set_property PACKAGE_PIN U4 [get_ports anode_out[1]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[1]]
set_property PACKAGE_PIN V4 [get_ports anode_out[2]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[2]]
set_property PACKAGE_PIN W4 [get_ports anode_out[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[3]]

# Seven Segment LEDs
set_property PACKAGE_PIN W7 [get_ports seg_out[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[0]]
set_property PACKAGE_PIN W6 [get_ports seg_out[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[1]]
set_property PACKAGE_PIN U8 [get_ports seg_out[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[2]]
set_property PACKAGE_PIN V8 [get_ports seg_out[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[3]]
set_property PACKAGE_PIN U5 [get_ports seg_out[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[4]]
set_property PACKAGE_PIN V5 [get_ports seg_out[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[5]]
set_property PACKAGE_PIN U7 [get_ports seg_out[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[6]]
set_property PACKAGE_PIN V7 [get_ports seg_out[7]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[7]]
