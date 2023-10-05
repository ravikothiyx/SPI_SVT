///////////////////////////////////////////////
// File:          spi_svt_base_sequence.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI 
// Discription:    
/////////////////////////////////////////////////
//
// Class Description:
//
//
`ifndef SPI_SVT_BASE_SEQUENCE_SV
`define SPI_SVT_BASE_SEQUENCE_SV

class spi_svt_base_sequence extends uvm_sequence;
   // UVM Factory Registration Macro
   //
   `uvm_object_utils(spi_svt_base_sequence);

   //------------------------------------------
   // Methods
   //------------------------------------------

   // Standard UVM Methods:  
   function new(string name = "spi_svt_base_sequence");
      super.new(name);
   endfunction : new

   task body();
      `uvm_info(get_type_name(),"START OF THE BASE SEQUENCE BODY",UVM_HIGH);
      `uvm_info(get_type_name(),"END OF THE BASE SEQUENCE BODY",UVM_HIGH);
   endtask : body 
endclass : spi_svt_base_sequence
`endif //: SPI_SVT_BASE_SEQUENCE_SV
