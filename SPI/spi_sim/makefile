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
<<<<<<< HEAD
	vsim -novopt $(TOP_N) -do "do runsim.do"

#To run the simulation in command prompt
sim_c:
	vsim -novopt $(TOP_N) -c -do "run -all; exit"

=======
	vsim -novopt $(TOP_N) -do "run -all; exit"
>>>>>>> ca595c3c8e7b85092f7ac4e5a5dea8a1b54e242b

#To run the simulation in command prompt
sim_c:
	vsim -novopt $(TOP_N) -c -do "run -all; exit"
