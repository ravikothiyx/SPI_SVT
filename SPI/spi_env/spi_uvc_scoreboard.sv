//////////////////////////////////////////////// 
// File:          spi_uvc_scoreboard.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SCOREBOARD_SV
`define SPI_UVC_SCOREBOARD_SV

class spi_uvc_scoreboard extends uvm_scoreboard;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_scoreboard);

   /** Transaction class instance*/
   spi_uvc_trans trans_h;

   /** Analysis implementation port declaration*/
   uvm_analysis_imp#(spi_uvc_trans,spi_uvc_scoreboard) mon_imp;
   
   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_scoreboard",uvm_component parent);

   /** Write method of the monitor*/
   extern function void write(spi_uvc_trans trans_h);

   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_scoreboard
`endif /** SPI_UVC_SCOREBOARD_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_scoreboard::new(string name = "spi_uvc_scoreboard",uvm_component parent);
      super.new(name,parent);
      /** Constructing the imp ports*/
      mon_imp = new("mon_imp",this);
   endfunction : new

   /** Write method of the master monitor*/
   function void spi_uvc_scoreboard::write(spi_uvc_trans trans_h);
   endfunction : write

   /** Run_phase*/
   task spi_uvc_scoreboard::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
