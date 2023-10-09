////////////////////////////////////////////////
// File:          spi_svt_virtual_sequencer.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

//
// Class Description:
//
//
`ifndef SPI_SVT_VIRTUAL_SEQUENCER
`define SPI_SVT_VIRTUAL_SEQUENCER
class spi_svt_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
   // UVM Factory Registration Macro
   //  
   `uvm_component_utils(spi_svt_virtual_sequencer);

   //Instance of the sub_sequencers
   //
   spi_svt_master_sequencer mseqr_h;
   spi_svt_slave_sequencer  sseqr_h;

   //------------------------------------------
   // Methods
   //------------------------------------------

   //Standard UVM Methods: 
   extern function new(string name = "spi_svt_virtual_sequencer",uvm_component parent);

endclass : spi_svt_virtual_sequencer
`endif //: SPI_SVT_VIRTUAL_SEQUENCER

   function spi_svt_virtual_sequencer::new(string name = "spi_svt_virtual_sequencer",uvm_component parent);
      super.new(name,parent);
   endfunction : new
