//////////////////////////////////////////////// 
// File:          spi_svt_master_monitor.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_SVT_MASTER_MONITOR_SV
`define SPI_SVT_MASTER_MONITOR_SV

class spi_svt_master_monitor extends uvm_monitor;
   
   /** UVM Factory Registration Macro**/
   `uvm_component_utils(spi_svt_master_monitor);

   /** Analysis port for scoreaboard and coverage collector*/
   uvm_analysis_port#(spi_svt_trans) item_collected_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_svt_master_monitor",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_svt_master_monitor
`endif //: SPI_SVT_MASTER_MONITOR_SV

   /** Standard UVM Methods*/
   function spi_svt_master_monitor::new(string name = "spi_svt_master_monitor",uvm_component parent);
      super.new(name,parent);
      item_collected_port = new("item_collected_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_svt_master_monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_svt_master_monitor::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_svt_master_monitor::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
