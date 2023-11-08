#makefile

PKG		= ..\tb\spi_uvc_pkg.sv  
INCLUDE = +incdir+..\include +incdir+..\src +incdir+..\master_agent +incdir+..\slave_agent +incdir+..\env +incdir+..\seq +incdir+..\tests
TOP 	= ..\tb\spi_uvc_top.sv
TOP_N 	= spi_uvc_top


#To make a work file
lib:
	vlib work

#To compile the code
comp:
	vlog $(PKG) $(TOP) $(INCLUDE)

#To run the simulation in questasim
sim:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000000"
	
#To run the simulation in command prompt
sim_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000000"
	
sanity_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000000"

b2b_wr_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000000"
	
b2b_rd_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000000"
	
b2b_wr_rd_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000"

sanity_mode0_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000000"

b2b_wr_mode0_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000000"
	
b2b_rd_mode0_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000000"
	
b2b_wr_rd_mode0_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000"

sanity_mode1_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000100"

b2b_wr_mode1_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000100"
	
b2b_rd_mode1_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000100"
	
b2b_wr_rd_mode1_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100"
	
sanity_mode2_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001000"

b2b_wr_mode2_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001000"
	
b2b_rd_mode2_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001000"
	
b2b_wr_rd_mode2_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001000"
	
sanity_mode3_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001100"

b2b_wr_mode3_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001100"
	
b2b_rd_mode3_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001100"
	
b2b_wr_rd_mode3_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001100"
	
sanity_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000100"

b2b_wr_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000100"
	
b2b_rd_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000100"
	
b2b_wr_rd_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100"

sanity_mode0_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000000"

b2b_wr_mode0_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000000"
	
b2b_rd_mode0_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000000"
	
b2b_wr_rd_mode0_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000"

sanity_mode1_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000100"

b2b_wr_mode1_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000100"
	
b2b_rd_mode1_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000100"
	
b2b_wr_rd_mode1_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100"
	
sanity_mode2_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001000"

b2b_wr_mode2_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001000"
	
b2b_rd_mode2_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001000"
	
b2b_wr_rd_mode2_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001000"
	
sanity_mode3_test: 
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001100"

b2b_wr_mode3_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001100"
	
b2b_rd_mode3_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001100"
	
b2b_wr_rd_mode3_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001100"

sanity_mode0_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000001"

b2b_wr_mode0_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000001"
	
b2b_rd_mode0_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000001"
	
b2b_wr_rd_mode0_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000001"

sanity_mode1_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000101"

b2b_wr_mode1_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000101"
	
b2b_rd_mode1_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000101"
	
b2b_wr_rd_mode1_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000101"
	
sanity_mode2_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001001"

b2b_wr_mode2_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001001"
	
b2b_rd_mode2_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001001"
	
b2b_wr_rd_mode2_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001001"
	
sanity_mode3_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001101"

b2b_wr_mode3_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001101"
	
b2b_rd_mode3_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001101"
	
b2b_wr_rd_mode3_lsb_test:
	vsim -assertdebug -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001101"

sanity_mode0_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000001"

b2b_wr_mode0_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000001"
	
b2b_rd_mode0_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000001"
	
b2b_wr_rd_mode0_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000001"

sanity_mode1_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000101"

b2b_wr_mode1_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000101"
	
b2b_rd_mode1_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000101"
	
b2b_wr_rd_mode1_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000101"
	
sanity_mode2_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001001"

b2b_wr_mode2_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001001"
	
b2b_rd_mode2_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001001"
	
b2b_wr_rd_mode2_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001001"
	
sanity_mode3_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001101"

b2b_wr_mode3_lsb_test_c: 
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001101"
	
b2b_rd_mode3_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001101"
	
b2b_wr_rd_mode3_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001101"
	
#code coverage regression	
regression_8:
	vlog -coveropt 3 +cover +acc $(PKG) $(TOP) $(INCLUDE) +define+DATA_WIDTH=8
	
#mode0 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0000	
	
#mode1 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0100

#mode2 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1000
	
#mode3 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1100
	
#mode0 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0001	
	
#mode1 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0101

#mode2 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1001
	
#mode3 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1101
	
	vcover merge SPI_UVC.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb
	vcover report -html -htmldir SPI_UVC_COV SPI_UVC.ucdb 
	del SPI_UVC.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb 
	
	
regression_16:
	vlog -coveropt 3 +cover +acc $(PKG) $(TOP) $(INCLUDE) +define+DATA_WIDTH=16
	
#mode0 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0000	
	
#mode1 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0100

#mode2 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1000
	
#mode3 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1100
	
#mode0 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0001	
	
#mode1 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0101

#mode2 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1001
	
#mode3 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1101
	
	vcover merge SPI_UVC_16.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb
	vcover report -html -htmldir SPI_UVC_COV_16 SPI_UVC_16.ucdb 
	del SPI_UVC_16.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb 
	

regression_32:
	vlog -coveropt 3 +cover +acc $(PKG) $(TOP) $(INCLUDE) +define+DATA_WIDTH=32
	
#mode0 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0000	
	
#mode1 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0100

#mode2 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1000
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1000
	
#mode3 msb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_msb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_msb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_msb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1100
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1100
	
#mode0 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode0_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode0_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode0_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0001	
	
#mode1 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode1_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode1_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode1_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_0101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_0101

#mode2 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode2_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode2_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode2_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1001
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1001
	
#mode3 lsb first
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_sanity_test_mode3_lsb.ucdb; run -all; exit" +UVM_TESTNAME=spi_uvc_sanity_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_test_mode3_lsb.ucdb; run -all; exit"   +UVM_TESTNAME=spi_uvc_b2b_wr_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_rd_test_mode3_lsb.ucdb ; run -all; exit" +UVM_TESTNAME=spi_uvc_b2b_rd_test +spicr1=0100_1101
	vsim -vopt -coverage $(TOP_N) -c -do "coverage save -onexit -directive -cvg -codeall spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb; run -all; exit"  +UVM_TESTNAME=spi_uvc_b2b_wr_rd_test +spicr1=0100_1101
	
	vcover merge SPI_UVC_32.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb
	vcover report -html -htmldir SPI_UVC_COV_32 SPI_UVC_32.ucdb 
	del SPI_UVC_32.ucdb spi_uvc_sanity_test_mode0_msb.ucdb spi_uvc_b2b_wr_test_mode0_msb.ucdb spi_uvc_b2b_rd_test_mode0_msb.ucdb spi_uvc_b2b_wr_rd_test_mode0_msb.ucdb spi_uvc_sanity_test_mode1_msb.ucdb spi_uvc_b2b_wr_test_mode1_msb.ucdb spi_uvc_b2b_rd_test_mode1_msb.ucdb spi_uvc_b2b_wr_rd_test_mode1_msb.ucdb spi_uvc_sanity_test_mode2_msb.ucdb spi_uvc_b2b_wr_test_mode2_msb.ucdb spi_uvc_b2b_rd_test_mode2_msb.ucdb spi_uvc_b2b_wr_rd_test_mode2_msb.ucdb spi_uvc_sanity_test_mode3_msb.ucdb spi_uvc_b2b_wr_test_mode3_msb.ucdb spi_uvc_b2b_rd_test_mode3_msb.ucdb spi_uvc_b2b_wr_rd_test_mode3_msb.ucdb spi_uvc_sanity_test_mode0_lsb.ucdb spi_uvc_b2b_wr_test_mode0_lsb.ucdb spi_uvc_b2b_rd_test_mode0_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode0_lsb.ucdb spi_uvc_sanity_test_mode1_lsb.ucdb spi_uvc_b2b_wr_test_mode1_lsb.ucdb spi_uvc_b2b_rd_test_mode1_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode1_lsb.ucdb spi_uvc_sanity_test_mode2_lsb.ucdb spi_uvc_b2b_wr_test_mode2_lsb.ucdb spi_uvc_b2b_rd_test_mode2_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode2_lsb.ucdb spi_uvc_sanity_test_mode3_lsb.ucdb spi_uvc_b2b_wr_test_mode3_lsb.ucdb spi_uvc_b2b_rd_test_mode3_lsb.ucdb spi_uvc_b2b_wr_rd_test_mode3_lsb.ucdb 

sanity_mode0_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000000 $(size)"	

b2b_wr_mode0_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000000 $(size)"
	
b2b_rd_mode0_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000000 $(size)"
	
b2b_wr_rd_mode0_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000 $(size)"

sanity_mode1_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000100 $(size)"

b2b_wr_mode1_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000100 $(size)"
	
b2b_rd_mode1_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000100 $(size)"
	
b2b_wr_rd_mode1_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100 $(size)"
	
sanity_mode2_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001000 $(size)"

b2b_wr_mode2_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001000 $(size)"
	
b2b_rd_mode2_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001000 $(size)"
	
b2b_wr_rd_mode2_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001000 $(size)"
	
sanity_mode3_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001100 $(size)"

b2b_wr_mode3_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001100 $(size)"
	
b2b_rd_mode3_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001100 $(size)"
	
b2b_wr_rd_mode3_size_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001100 $(size)"
	
	
sanity_mode0_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000000 $(size)"

b2b_wr_mode0_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000000 $(size)"
	
b2b_rd_mode0_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000000 $(size)"
	
b2b_wr_rd_mode0_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000 $(size)"

sanity_mode1_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000100 $(size)"

b2b_wr_mode1_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000100 $(size)"
	
b2b_rd_mode1_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000100 $(size)"
	
b2b_wr_rd_mode1_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100 $(size)"
	
sanity_mode2_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001000 $(size)"

b2b_wr_mode2_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001000 $(size)"
	
b2b_rd_mode2_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001000 $(size)"
	
b2b_wr_rd_mode2_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001000 $(size)"
	
sanity_mode3_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001100 $(size)"

b2b_wr_mode3_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001100 $(size)"
	
b2b_rd_mode3_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001100 $(size)"
	
b2b_wr_rd_mode3_size_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001100 $(size)"
	
sanity_mode0_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000000 $(size)"	

b2b_wr_mode0_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000000 $(size)"
	
b2b_rd_mode0_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000000 $(size)"
	
b2b_wr_rd_mode0_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000000 $(size)"

sanity_mode1_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01000100 $(size)"

b2b_wr_mode1_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01000100 $(size)"
	
b2b_rd_mode1_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01000100 $(size)"
	
b2b_wr_rd_mode1_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000100 $(size)"
	
sanity_mode2_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001000 $(size)"

b2b_wr_mode2_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001000 $(size)"
	
b2b_rd_mode2_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001000 $(size)"
	
b2b_wr_rd_mode2_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001000 $(size)"
	
sanity_mode3_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_sanity_test 01001100 $(size)"

b2b_wr_mode3_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_test 01001100 $(size)"
	
b2b_rd_mode3_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_rd_test 01001100 $(size)"
	
b2b_wr_rd_mode3_size_lsb_test_c:
	vsim -novopt $(TOP_N) -c -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001100 $(size)"
	
	
sanity_mode0_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000001 $(size)"

b2b_wr_mode0_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000001 $(size)"
	
b2b_rd_mode0_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000001 $(size)"
	
b2b_wr_rd_mode0_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000001 $(size)"

sanity_mode1_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01000101 $(size)"

b2b_wr_mode1_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01000101 $(size)"
	
b2b_rd_mode1_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01000101 $(size)"
	
b2b_wr_rd_mode1_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01000101 $(size)"
	
sanity_mode2_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001001 $(size)"

b2b_wr_mode2_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001001 $(size)"
	
b2b_rd_mode2_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001001 $(size)"
	
b2b_wr_rd_mode2_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001001 $(size)"
	
sanity_mode3_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_sanity_test 01001101 $(size)"

b2b_wr_mode3_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_test 01001101 $(size)"
	
b2b_rd_mode3_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_rd_test 01001101 $(size)"
	
b2b_wr_rd_mode3_size_lsb_test:
	vsim -novopt $(TOP_N) -do "do runsim.do spi_uvc_b2b_wr_rd_test 01001101 $(size)"