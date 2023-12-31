//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_master_sequencer.sv
// Version:       1.0
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_SEQUENCER_SV
`define SPI_UVC_MASTER_SEQUENCER_SV

class spi_uvc_master_sequencer extends uvm_sequencer#(spi_uvc_transaction);
    
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_master_sequencer);

  /** Standard UVM Methods*/
  extern function new(string name = "spi_uvc_master_sequencer",uvm_component parent);

  /** Build_phase*/
  extern function void build_phase(uvm_phase phase);

  /** Connect_phase*/
  extern function void connect_phase(uvm_phase phase);
   
  /** Run_phase*/
  extern task run_phase(uvm_phase phase);

endclass : spi_uvc_master_sequencer
`endif //: SPI_UVC_MASTER_SEQUENCER_SV

  /** Standard UVM Methods*/
  function spi_uvc_master_sequencer::new(string name = "spi_uvc_master_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction : new

  /** Build_phase*/
  function void spi_uvc_master_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
    `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
  endfunction : build_phase

  /** Connect_phase*/
  function void spi_uvc_master_sequencer::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
    `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
  endfunction : connect_phase
   
  /** Run_phase*/
  task spi_uvc_master_sequencer::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_MEDIUM);
    `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_MEDIUM);
  endtask : run_phase
