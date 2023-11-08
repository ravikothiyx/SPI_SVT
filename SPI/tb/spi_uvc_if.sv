//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_if.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`timescale 10ns/1ps
interface spi_uvc_if(input bit bclk,input bit rstn);

  logic sclk;
  logic ss_n;
  logic mosi;
  logic miso;

  modport MSTR_MP (input sclk,output ss_n, output mosi, input miso);
  modport SLV_MP  (output sclk,input ss_n, input mosi, output miso);
endinterface : spi_uvc_if
