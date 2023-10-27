#makefile

PKG		= ..\tb\spi_uvc_pkg.sv  
INCLUDE = +incdir+..\include +incdir+..\src +incdir+..\master_agent +incdir+..\slave_agent +incdir+..\env +incdir+..\seq +incdir+..\tests
TOP 	= ..\tb\spi_uvc_top.sv
TOP_N 	= spi_uvc_top
COVERAGE = -c -do "coverage save -onexit -directive -cvg -codeall

#To make a work file
lib:
	vlib work

#To compile the code
comp:
	vlog $(PKG) $(TOP) $(INCLUDE)

#To run the simulation in questasim
sim:
	vsim -novopt $(TOP_N) -do "do runsim.do"

#To run the simulation in command prompt
sim_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do"
	
sanity_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test"

b2b_wr_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test"
	
b2b_rd_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test"
	
b2b_wr_rd_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test"
	
sanity_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test"

b2b_wr_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test"
	
b2b_rd_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test"
	
b2b_wr_rd_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test"
	
#code coverage regression	
regression:
	vlog -coveropt 3 +cover +acc $(PKG) $(TOP) $(INCLUDE)
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_wr_test.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_wr_test
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test
	vcover merge SPI_UVC.ucdb spi_uvc_sanity_test.ucdb spi_uvc_wr_test.ucdb spi_uvc_b2b_rd_test.ucdb spi_uvc_b2b_wr_rd_test.ucdb 
	vcover report -html -htmldir SPI_UVC_COV SPI_UVC.ucdb 
	del spi_uvc_sanity_test.ucdb spi_uvc_wr_test.ucdb spi_uvc_b2b_rd_test.ucdb spi_uvc_b2b_wr_rd_test.ucd