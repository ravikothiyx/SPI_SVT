//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_bus_monitor.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_BUS_MONITOR_SV
`define SPI_UVC_BUS_MONITOR_SV

class spi_uvc_bus_monitor extends uvm_monitor;
   
  /** UVM Factory Registration Macro**/
  `uvm_component_utils(spi_uvc_bus_monitor);

  /** Standard UVM Methods*/
  function new(string name = "spi_uvc_bus_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction : new

  /** Build_phase*/
  extern function void build_phase(uvm_phase phase);

  /** Connect_phase*/
  extern function void connect_phase(uvm_phase phase);
   
  /** Run_phase*/
  extern task run_phase(uvm_phase phase);
endclass : spi_uvc_bus_monitor
`endif /** SPI_UVC_MASTER_MONITOR_SV*/

  /** Build_phase*/
  function void spi_uvc_bus_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
    `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
  endfunction : build_phase

  /** Connect_phase*/
  function void spi_uvc_bus_monitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
    `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
  endfunction : connect_phase
   
  /** Run_phase*/
  task spi_uvc_bus_monitor::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
    `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
  endtask : run_phase
