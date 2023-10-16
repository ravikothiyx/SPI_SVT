//////////////////////////////////////////////// 
// File:          spi_uvc_slave_monitor.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_MONITOR_SV
`define SPI_UVC_SLAVE_MONITOR_SV

class spi_uvc_slave_monitor extends uvm_monitor;
   
   /** UVM Factory Registration Macro**/
   `uvm_component_utils(spi_uvc_slave_monitor);

   /**Analysis port for scoreaboard and coverage collector*/
   uvm_analysis_port#(spi_uvc_transaction) item_collected_port;

   /**Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_monitor",uvm_component parent);

   /**build_phase*/
   extern function void build_phase(uvm_phase phase);

   /**connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /**run_phase*/
   extern task run_phase(uvm_phase phase);
endclass : spi_uvc_slave_monitor
`endif /**: SPI_UVC_SLAVE_MONITOR_SV*/

   /**Standard UVM Methods*/
   function spi_uvc_slave_monitor::new(string name = "spi_uvc_slave_monitor",uvm_component parent);
      super.new(name,parent);
      item_collected_port = new("item_collected_port",this);
   endfunction : new

   /**build_phase*/
   function void spi_uvc_slave_monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /**connect_phase*/
   function void spi_uvc_slave_monitor::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**run_phase*/
   task spi_uvc_slave_monitor::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase