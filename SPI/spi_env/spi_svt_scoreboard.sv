//////////////////////////////////////////////// 
// File:          spi_svt_scoreboard.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_SVT_SCOREBOARD_SV
`define SPI_SVT_SCOREBOARD_SV

class spi_svt_scoreboard extends uvm_scoreboard;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_scoreboard);

   /** Transaction class instance*/
   spi_svt_trans trans_h;

   /** Analysis implementation for the master and slave monitor*/
   `uvm_analysis_imp_decl(_spi_svt_mas_mon)
   `uvm_analysis_imp_decl(_spi_svt_slv_mon)

   /** Analysis implementation port declaration*/
   uvm_analysis_imp_spi_svt_mas_mon#(spi_svt_trans,spi_svt_scoreboard) mmon_imp;
   uvm_analysis_imp_spi_svt_slv_mon#(spi_svt_trans,spi_svt_scoreboard) smon_imp;
   
   /** Standard UVM Methods*/
   function new(string name = "spi_svt_scoreboard",uvm_component parent);
      super.new(name,parent);
     
      /** Constructing the implementation ports*/
      mmon_imp = new("mmon_imp",this);
      smon_imp = new("smon_imp",this);
   endfunction : new

<<<<<<< HEAD
   /** Write method of the master monitor*/
   function void write_spi_svt_mas_mon(spi_svt_trans trans);
   endfunction : write_spi_svt_mas_mon 

   /** Write method of the slave monitor*/
   function void write_spi_svt_slv_mon(spi_svt_trans trans);
   endfunction : write_spi_svt_slv_mon

   /** Run_phase*/
=======
   function void write_spi_svt_mas_mon(spi_svt_trans trans);
      
   endfunction : write_spi_svt_mas_mon 

   function void write_spi_svt_slv_mon(spi_svt_trans trans);
   endfunction : write_spi_svt_slv_mon
   //run_phase
>>>>>>> ca595c3c8e7b85092f7ac4e5a5dea8a1b54e242b
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_scoreboard
`endif /** SPI_SVT_SCOREBOARD_SV*/
