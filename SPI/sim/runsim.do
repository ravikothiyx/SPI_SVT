vlib work
vlog ../tb/spi_uvc_pkg.sv ../tb/spi_uvc_top.sv +incdir+../env +incdir+../include +incdir+../master_agent +incdir+../seq +incdir+../slave_agent +incdir+../src +incdir+../tests +incdir+../tb
vsim -novopt spi_uvc_top
add wave -position insertpoint  \
sim:/spi_uvc_top/bclk
add wave -position insertpoint  \
sim:/spi_uvc_top/inf/clk \
sim:/spi_uvc_top/inf/miso \
sim:/spi_uvc_top/inf/mosi \
sim:/spi_uvc_top/inf/rstn \
sim:/spi_uvc_top/inf/sclk \
sim:/spi_uvc_top/inf/ss_n
run -all
wave zoom full
# {0 ps} {341250 ps}
config wave -signalnamewidth 1
