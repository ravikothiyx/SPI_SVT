//////////////////////////////////////////////// 
// File:          spi_uvc_top.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`timescale 10ns/1ps
`ifndef SPI_UVC_TOP_SV
`define SPI_UVC_TOP_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

module spi_uvc_top;

   /**importing the package*/
   import spi_uvc_pkg::*;

   /** Bus clock*/
   bit bclk;

   /** Reset*/
   bit rstn = 1;

   /** Clock generation 25Mhz*/
   initial begin			
	   bclk = 1'd0;
	   forever
	      bclk = #40 ~bclk;
   end

   /** Interface instance*/
   spi_uvc_if inf(bclk,rstn);
   
   /**run_test method*/
   initial begin
      /** Set the SPI interface*/
      uvm_config_db#(virtual spi_uvc_if)::set(null,"*","vif",inf);
      run_test("spi_uvc_base_test");
   end
endmodule : spi_uvc_top
`endif /** SPI_UVC_TOP*/
