set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports direction1]
set_property IOSTANDARD LVCMOS33 [get_ports direction2]
set_property IOSTANDARD LVCMOS33 [get_ports en]
set_property IOSTANDARD LVCMOS33 [get_ports signal]
set_property PACKAGE_PIN D14 [get_ports direction1]
set_property PACKAGE_PIN E16 [get_ports direction2]
set_property PACKAGE_PIN F16 [get_ports signal]
set_property PACKAGE_PIN J17 [get_ports en]

set_property PACKAGE_PIN E3 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports dirSwich]
set_property PACKAGE_PIN M17 [get_ports dirSwich]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dirSwich_IBUF]


set_property IOSTANDARD LVCMOS33 [get_ports slowDown]
set_property IOSTANDARD LVCMOS33 [get_ports speedUp]
set_property PACKAGE_PIN P18 [get_ports slowDown]
set_property PACKAGE_PIN M18 [get_ports speedUp]
