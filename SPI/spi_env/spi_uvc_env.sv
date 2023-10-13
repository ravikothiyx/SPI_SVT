//////////////////////////////////////////////// 
// File:          spi_uvc_env.sv
// Version:       v1
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_ENV_SV
`define SPI_UVC_ENV_SV

class spi_uvc_env extends uvm_env;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_env);

   /** Master and Salve agent config instances*/
   spi_uvc_master_config mstr_cfg_h;
   spi_uvc_slave_config  slv_cfg_h;

   /** Master and Salve agent instances*/
   spi_uvc_master_agent mstr_agent_h;
   spi_uvc_slave_agent  slv_agent_h;

   /** Environment class instance*/
   spi_uvc_env_config env_cfg_h;

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

      /** Retriving the Environment config class*/
      if(!uvm_config_db#(spi_uvc_env_config)::get(this,"","env_cfg_h",env_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the environment config");
      
      
      if(env_cfg_h.mstr == 1'b1) begin
         /** Creating master configuration*/
         mstr_cfg_h = spi_uvc_master_config::type_id::create("mstr_cfg_h",this);

         /** Creating the master agent class*/
         mstr_agent_h = spi_uvc_master_agent::type_id::create("mstr_agent_h",this);

         /** Master agent configuration class is set*/
         uvm_config_db#(spi_uvc_master_config)::set(this,"*","mstr_cfg_h",mstr_cfg_h);
      end /** if*/

      if(env_cfg_h.mstr == 1'b0) begin
         /** Creating slave configuration*/
         slv_cfg_h = spi_uvc_slave_config::type_id::create("slv_cfg_h",this);
         
         /** Creating the master agent class*/
         slv_agent_h = spi_uvc_slave_agent::type_id::create("slv_agent_h",this);

         /** Slave agent configuration class is set*/
         uvm_config_db#(spi_uvc_slave_config)::set(this,"*","slv_cfg_h",slv_cfg_h);

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
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**Run_phase*/
   task spi_uvc_env::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
