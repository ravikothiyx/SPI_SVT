//////////////////////////////////////////////// 
// File:          spi_uvc_env.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_ENV_SV
`define SPI_UVC_ENV_SV

class spi_uvc_env extends uvm_env;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_env);

   /** Environment class instance*/
   spi_uvc_env_config env_cfg_h;

   /** Agent configuration class instance*/
   spi_uvc_agent_config agent_cfg_h;

   /** Agent class instance*/
   spi_uvc_agent agent_h;

   /** Scoreboard class instance*/
   spi_uvc_scoreboard sb_h;

   /** Virtual seqeuncer instance*/
   spi_uvc_virtual_sequencer vseqr_h;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_env",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_env
`endif //: SPI_UVC_ENV_SV

   /** Standard UVM Methods*/
   function spi_uvc_env::new(string name = "spi_uvc_env",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_env::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /** Creating the agent class*/
      agent_h = spi_uvc_agent::type_id::create("agent_h",this);

      /** Creating agent configuration class*/
      agent_cfg_h = spi_uvc_agent_config::type_id::create("agent_cfg_h");

      /** Retriving the Environment config class*/
      if(!uvm_config_db#(spi_uvc_env_config)::get(this,"","env_cfg_h",env_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the environment config");
      
      /** Agent configuration class is set*/
      uvm_config_db#(spi_uvc_agent_config)::set(this,"*","agent_cfg_h",agent_cfg_h);
         
      if(env_cfg_h.enable_sb)begin
         /** Creating Scoreboard*/
         sb_h = spi_uvc_scoreboard::type_id::create("sb_h",this);
      end /** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      /** Creating the virtual sequencer*/
      vseqr_h = spi_uvc_virtual_sequencer::type_id::create("vseqr_h",this);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_env::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      /** Coverage is enabled and disable as per the config class*/
      if(env_cfg_h.enable_sb)begin
         /** Master monitor and slave monitor connection to the scoreboard*/
         agent_h.agent_port.connect(sb_h.mon_imp);
      end

      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_env::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
