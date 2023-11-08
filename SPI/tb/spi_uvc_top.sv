//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_top.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`timescale 10ns/1ps
`ifndef SPI_UVC_TOP_SV
`define SPI_UVC_TOP_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

/** Importing the package*/
import spi_uvc_pkg::*;

/** Including spi interface*/
`include "spi_uvc_if.sv"

/** Including the assertions*/
`include "spi_uvc_assertions.sv"

module spi_uvc_top;

  /** Bus clock*/
  bit bclk;
 
  /** Reset*/
  bit rstn = 1;
   
  /** Interface instance*/
  spi_uvc_if inf(bclk,rstn);
   
  initial begin
    rstn = 1'b0;
    #10;
    rstn = 1'b1;
    //#25;
    //rstn = 1'b0;
    //#10;
    //rstn = 1'b1;
  end /** initial*/

  /** Clock generation 25Mhz*/
  initial begin			
	  forever #20ns bclk = ~bclk;
  end /** initial*/

  /** run_test method*/
  initial begin
    /** Set the SPI interface*/
    uvm_config_db#(virtual spi_uvc_if)::set(null,"*","vif",inf);
    run_test("");
  end /** initial*/

  /** Binding assertion to the interface*/
  bind inf spi_uvc_assertions asrt(inf.bclk,inf.sclk,inf.ss_n,inf.mosi,inf.miso);
endmodule : spi_uvc_top
`endif /** SPI_UVC_TOP*/
