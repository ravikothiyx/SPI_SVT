//////////////////////////////////////////////// 
// File:          spi_uvc_if.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

interface spi_uvc_if(input bit clk);

  logic sclk;
  logic ss_n;
  logic mosi;
  logic miso;

  modport MSTR_MP (input sclk,output ss_n, output mosi, input miso);
  modport SLV_MP  (output sclk,input ss_n, input mosi, output miso);

endinterface : spi_uvc_if
