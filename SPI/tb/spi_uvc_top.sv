//////////////////////////////////////////////// 
// File:          spi_uvc_top.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////




module spi_uvc_top;

   import uvm_pkg::*;
   `include "uvm_macros.svh"
   /**importing the package*/
   import spi_uvc_pkg::*;

   /**run_test method*/
   initial begin
      run_test("spi_uvc_base_test");
   end
endmodule : spi_uvc_top
