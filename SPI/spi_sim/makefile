#makefile

PKG		= ..\spi_test\spi_svt_pkg.sv
INCLUDE = +incdir+..\spi_env +incdir+..\spi_test
TOP 	= ..\spi_top\spi_svt_top.sv
TOP_N 	= spi_svt_top


#To make a work file
lib:
	vlib work

#To compoile the code
comp:
	vlog $(PKG) $(TOP) $(INCLUDE)

#To run the simulation in questasim
sim:
	vsim -novopt -c $(TOP_N) -do "run -all;exit"

