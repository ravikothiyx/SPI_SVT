///////////////////////////////////////////////
// File:          spi_svt_virtual_sequence.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////
//
// Class Description:
//
//
`ifndef SPI_SVT_VIRTUAL_SEQUENCE_SV
`define SPI_SVT_VIRTUAL_SEQUENCE_SV

class spi_svt_virtual_sequence_vseq extends uvm_sequence#(uvm_sequence_item);
   // UVM Factory Registration Macro
   //
   `uvm_object_utils(spi_svt_virtual_sequence_vseq);

   //------------------------------------------
   // Methods
   //------------------------------------------

   // Standard UVM Methods:  
   extern function new(string name = "spi_svt_virtual_sequence_vseq");

endclass : spi_svt_virtual_sequence_vseq
`endif //: SPI_SVT_VIRTUAL_SEQUENCE_SV

   function spi_svt_virtual_sequence_vseq::new(string name = "spi_svt_virtual_sequence_vseq");
      super.new(name);
   endfunction : new

