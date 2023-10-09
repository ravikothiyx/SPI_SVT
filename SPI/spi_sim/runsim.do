vlib work
vlog ../spi_test/spi_svt_pkg.sv +incdir+../spi_env +incdir+../spi_test ../spi_top/spi_svt_top.sv
vsim -novopt spi_svt_top
run -all
wave zoom full
# {0 ps} {341250 ps}
config wave -signalnamewidth 1
