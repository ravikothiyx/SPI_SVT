//////////////////////////////////////////////// 
// File:          spi_uvc_master_uvc.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_UVC_SV
`define SPI_UVC_MASTER_UVC_SV

class spi_uvc_master_uvc extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_master_uvc);

   /** Master agent configuration class instance*/
   spi_uvc_master_config mstr_cfg_h;

   /** Environment class configuration instance*/
   spi_uvc_env_config env_cfg_h;

   /** Master agent class instance*/
   spi_uvc_master_agent mstr_agent_h[];

   /** Analysis port foe the agent to uvc connection*/
   uvm_analysis_port#(spi_uvc_trans) mstr_uvc_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_master_uvc",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_master_uvc
`endif //: SPI_UVC_MASTER_UVC_SV

   /** Standard UVM Methods*/
   function spi_uvc_master_uvc::new(string name = "spi_uvc_master_uvc",uvm_component parent);
      super.new(name,parent);
      mstr_uvc_port = new("mstr_uvc_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_master_uvc::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /** Retriving the Environment config class*/
      if(!uvm_config_db#(spi_uvc_env_config)::get(this,"","env_cfg_h",env_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the environment config");
  
      /** Master agent config class creation*/
      mstr_cfg_h = env_cfg_h.mstr_cfg_h;

      /** Retriving the master configuration class*/
      uvm_config_db#(spi_uvc_master_config)::set(this,"*","mstr_cfg_h",mstr_cfg_h);
      
      /** Creating master agent class*/
      mstr_agent_h = new[mstr_cfg_h.no_of_agents];
      foreach(mstr_agent_h[i])
      begin
         mstr_agent_h[i] = spi_uvc_master_agent::type_id::create($sformatf("mstr_agent_h[%0d]",i),this);
      end

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_master_uvc::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      /** Connecting master agent*/
      foreach(mstr_agent_h[i])begin
         mstr_agent_h[i].mstr_agent_port.connect(mstr_uvc_port);
      end
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_master_uvc::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
