///////////////////////////////////////////////
// File:          spi_uvc_virtual_sequence.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_VIRTUAL_SEQUENCE_SV
`define SPI_UVC_VIRTUAL_SEQUENCE_SV

class spi_uvc_virtual_sequence_vseq extends uvm_sequence#(uvm_sequence_item);
  /**  UVM Factory Registration Macro*/
   
   `uvm_object_utils(spi_uvc_virtual_sequence_vseq);

   /** Standard UVM Methods: */ 
   extern function new(string name = "spi_uvc_virtual_sequence_vseq");

endclass : spi_uvc_virtual_sequence_vseq
`endif /** : SPI_UVC_VIRTUAL_SEQUENCE_SV */


   /** Standard UVM Methods: */ 
   function spi_uvc_virtual_sequence_vseq::new(string name = "spi_uvc_virtual_sequence_vseq");
      super.new(name);
   endfunction : new
