//////////////////////////////////////////////// 
// File:          spi_svt_top.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


import uvm_pkg::*;
`include "uvm_macros.svh"

module spi_svt_top;
   /**importing the package*/
   import spi_svt_pkg::*;

   /**run_test method*/
   initial begin
      run_test("spi_svt_base_test");
   end
endmodule : spi_svt_top
