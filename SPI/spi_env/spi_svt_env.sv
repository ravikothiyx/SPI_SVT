//////////////////////////////////////////////// 
// File:          spi_svt_env.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`ifndef SPI_SVT_ENV_SV
`define SPI_SVT_ENV_SV

class spi_svt_env extends uvm_env;
   
   // UVM Factory Registration Macro
   //
   `uvm_component_utils(spi_svt_env);

   //------------------------------------------
   // Master and Salve UVC handles
   //------------------------------------------ 
   spi_svt_master_uvc spi_muvc_h;
   spi_svt_slave_uvc  spi_suvc_h;

   //Instance of scoreboard 
   //
   spi_svt_scoreboard sb_h;

   // Standard UVM Methods
   function new(string name = "spi_svt_env",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
     
      //Creating master UVC
      //
      spi_muvc_h = spi_svt_master_uvc::type_id::create("spi_svt_master_uvc",this);

      //Creating slave UVC
      //
      spi_suvc_h = spi_svt_slave_uvc::type_id::create("spi_svt_slave_uvc",this);

      //Creating Scoreboard
      //
      sb_h = spi_svt_scoreboard::type_id::create("spi_svt_scoreboard",this);
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   //connect_phase
   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      //master monitor and slave monitor connection to the scoreboard
      spi_muvc_h.u_mport.connect(sb_h.mmon_imp);
      spi_suvc_h.u_sport.connect(sb_h.smon_imp);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);

      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   //run_phase
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);

      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_env
`endif //: SPI_SVT_ENV_SV
