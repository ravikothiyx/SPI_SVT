//////////////////////////////////////////////// 
// File:          spi_svt_master_sequencer.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_SVT_MASTER_SEQUENCER_SV
`define SPI_SVT_MASTER_SEQUENCER_SV

class spi_svt_master_sequencer extends uvm_sequencer#(spi_svt_trans);
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_master_sequencer);

   /** Standard UVM Methods*/
   function new(string name = "spi_svt_master_sequencer",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_master_sequencer
`endif /** SPI_SVT_MASTER_SEQUENCER_SV*/
