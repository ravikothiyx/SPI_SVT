//////////////////////////////////////////////// 
// File:          spi_uvc_defines.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////



`define ADDR_WIDTH 8

`ifdef D_W_8
  `define DATA_WIDTH 8
`endif

`ifdef D_W_16
  `define DATA_WIDTH 16
`endif

`ifdef D_W_32
  `define DATA_WIDTH 32
`endif
