//////////////////////////////////////////////// 
// File:          spi_svt_slave_sequencer.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`ifndef SPI_SVT_SLAVE_SEQUENCER_SV
`define SPI_SVT_SLAVE_SEQUENCER_SV

class spi_svt_slave_sequencer extends uvm_sequencer#(spi_svt_trans);
   
   // UVM Factory Registration Macro
   //
   `uvm_component_utils(spi_svt_slave_sequencer);

   // Standard UVM Methods
   extern function new(string name = "spi_svt_slave_sequencer",uvm_component parent);

   //build_phase
   extern function void build_phase(uvm_phase phase);

   //connect_phase
   extern function void connect_phase(uvm_phase phase);
   
   //run_phase
   extern task run_phase(uvm_phase phase);
endclass : spi_svt_slave_sequencer
`endif //: SPI_SVT_SLAVE_SEQUENCER_SV

  function spi_svt_slave_sequencer::new(string name = "spi_svt_slave_sequencer",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void spi_svt_slave_sequencer::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   //connect_phase
   function void spi_svt_slave_sequencer::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   //run_phase
   task spi_svt_slave_sequencer::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

