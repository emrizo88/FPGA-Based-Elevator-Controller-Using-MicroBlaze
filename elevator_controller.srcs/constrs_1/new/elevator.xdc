set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports {btn[0]}];
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {btn[1]}];
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {btn[2]}];
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {btn[3]}];
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {btn[4]}];

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {nfloor[0]}];
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {nfloor[1]}];
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {nfloor[2]}];
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {nfloor[3]}];
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {nfloor[4]}];

set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {seg[6]}];
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {seg[5]}];
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {seg[4]}];
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {seg[3]}];
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {seg[2]}];
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {seg[1]}];
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {seg[0]}];

set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {by[0]}];
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {by[1]}];
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {by[2]}];
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {by[3]}];
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {by[4]}];
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {by[5]}];
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {by[6]}];
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {by[7]}];

set_property PACKAGE_PIN V11 [get_ports lift_open]
set_property IOSTANDARD LVCMOS33 [get_ports lift_open]