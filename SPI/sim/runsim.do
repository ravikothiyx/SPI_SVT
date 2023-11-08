vlib work
vlog ../tb/spi_uvc_pkg.sv ../tb/spi_uvc_top.sv +incdir+../env +incdir+../include +incdir+../master_agent +incdir+../seq +incdir+../slave_agent +incdir+../src +incdir+../tests +incdir+../tb +define+DATA_WIDTH=8
vsim -assertdebug -novopt spi_uvc_top +UVM_TESTNAME=$1 +UVM_VERBOSITY=UVM_HIGH +spicr1=$2
add wave -position insertpoint  \
sim:/spi_uvc_top/bclk
add wave -position insertpoint  \
sim:/spi_uvc_top/inf/miso \
sim:/spi_uvc_top/inf/mosi \
sim:/spi_uvc_top/inf/rstn \
sim:/spi_uvc_top/inf/sclk \
sim:/spi_uvc_top/inf/ss_n
add wave -position end  /spi_uvc_top/inf/asrt/ERROR_SCLK_FREQ_FAILED
add wave -position end  /spi_uvc_top/inf/asrt/ERROR_SLAVE_SELECT_FAILED
add wave -position end  /spi_uvc_top/inf/asrt/ERROR_POLARITY_FAILED
add wave -position end  /spi_uvc_top/inf/asrt/ERROR_SLAVE_SELECT_ASSERT_FAILED
run -all
wave zoom full
# {0 ps} {341250 ps}
config wave -signalnamewidth 1
