vlib work
vlog ../spi_test/spi_uvc_pkg.sv +incdir+../spi_env +incdir+../spi_test ../spi_top/spi_uvc_top.sv
vsim -novopt spi_uvc_top
run -all
wave zoom full
# {0 ps} {341250 ps}
config wave -signalnamewidth 1
