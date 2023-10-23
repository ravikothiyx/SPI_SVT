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
   
/** Interface instance*/
   spi_uvc_if inf(bclk,rstn);
   
  initial begin
    rstn = 1'b0;
    #10;
    rstn = 1'b1;
 end

   /** Clock generation 25Mhz*/
   initial begin			
	   forever #2 bclk = ~bclk;
   end

   /**run_test method*/
   initial begin
      /** Set the SPI interface*/
      uvm_config_db#(virtual spi_uvc_if)::set(null,"*","vif",inf);
<<<<<<< HEAD
      run_test("spi_uvc_b2b_wr_test");
=======
      run_test("");
>>>>>>> 00e8d8542d5efdccf046b0cea9a36500594e4c14
   end
endmodule : spi_uvc_top
`endif /** SPI_UVC_TOP*/
