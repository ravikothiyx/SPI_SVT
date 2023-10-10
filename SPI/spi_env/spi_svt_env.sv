//////////////////////////////////////////////// 
// File:          spi_svt_env.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_SVT_ENV_SV
`define SPI_SVT_ENV_SV

class spi_svt_env extends uvm_env;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_env);

   /** Master and Salve UVC handles*/
   spi_svt_master_uvc spi_muvc_h;
   spi_svt_slave_uvc  spi_suvc_h;

   /** Environment class instance*/
   spi_svt_env_config ecfg_h;

   /** Scoreboard class instance*/
   spi_svt_scoreboard sb_h;

   /** Virtual seqeuncer instance*/
   spi_svt_virtual_sequencer vseqr_h;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_svt_env",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_svt_env
`endif //: SPI_SVT_ENV_SV

   /** Standard UVM Methods*/
   function spi_svt_env::new(string name = "spi_svt_env",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_svt_env::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving the Environment config class*/
      if(!uvm_config_db#(spi_svt_env_config)::get(this,"","ecfg_h",ecfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the environment config");

      /** Creating master UVC*/
      spi_muvc_h = spi_svt_master_uvc::type_id::create("spi_svt_master_uvc",this);

      /** Creating slave UVC*/
      spi_suvc_h = spi_svt_slave_uvc::type_id::create("spi_svt_slave_uvc",this);

      if(ecfg_h.enable_sb)begin
         /** Creating Scoreboard*/
         sb_h = spi_svt_scoreboard::type_id::create("spi_svt_scoreboard",this);
      end /** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      /** Creating the virtual sequencer*/
      vseqr_h = spi_svt_virtual_sequencer::type_id::create("vseqr_h",this);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_svt_env::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      /** Coverage is enabled and disable as per the config class*/
      if(ecfg_h.enable_sb)begin
         /** Master monitor and slave monitor connection to the scoreboard*/
         spi_muvc_h.u_mport.connect(sb_h.mmon_imp);
         spi_suvc_h.u_sport.connect(sb_h.smon_imp);
      end

      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);

      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**Run_phase*/
   task spi_svt_env::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);

      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
