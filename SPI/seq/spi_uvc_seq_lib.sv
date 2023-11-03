///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_seq_lib.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI 
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_SEQ_LIB_SV
`define SPI_UVC_SEQ_LIB_SV

class spi_uvc_seq_lib extends uvm_sequence#(uvm_sequence_item);
   /** UVM Factory Registration Macro */
   `uvm_object_utils(spi_uvc_seq_lib);

   /** Standard UVM Methods: */  
   extern function new(string name = "spi_uvc_seq_lib");
 
   /** body task */ 
   task body();
      `uvm_info(get_type_name(),"START OF THE BASE SEQUENCE BODY",UVM_HIGH);
      `uvm_info(get_type_name(),"END OF THE BASE SEQUENCE BODY",UVM_HIGH);
   endtask : body 
endclass : spi_uvc_seq_lib
`endif /** : SPI_UVC_SEQ_LIB_SV */

   /** Standard UVM Methods: */  
   function spi_uvc_seq_lib:: new(string name = "spi_uvc_seq_lib");
      super.new(name);
   endfunction : new

