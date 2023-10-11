////////////////////////////////////////////////
// File:          spi_uvc_virtual_sequencer.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

/**Class Description:*/
`ifndef SPI_UVC_VIRTUAL_SEQUENCER
`define SPI_UVC_VIRTUAL_SEQUENCER


class spi_uvc_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
   /**UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_virtual_sequencer);

   /** Methods*/

   /**Standard UVM Methods:*/ 
   extern function new(string name = "spi_uvc_virtual_sequencer",uvm_component parent);

endclass : spi_uvc_virtual_sequencer
`endif /** SPI_UVC_VIRTUAL_SEQUENCER*/

   /** Standard UVM Methods:*/ 
   function spi_uvc_virtual_sequencer::new(string name = "spi_uvc_virtual_sequencer",uvm_component parent);
      super.new(name,parent);
   endfunction : new
