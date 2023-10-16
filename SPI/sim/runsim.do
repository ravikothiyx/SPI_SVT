vlib work
vlog ../tb/spi_uvc_pkg.sv ../tb/spi_uvc_top.sv +incdir+../env +incdir+../include +incdir+../master_agent +incdir+../seq +incdir+../slave_agent +incdir+../src +incdir+../tests +incdir+../tb
vsim -novopt spi_uvc_top
run -all
wave zoom full
# {0 ps} {341250 ps}
config wave -signalnamewidth 1
