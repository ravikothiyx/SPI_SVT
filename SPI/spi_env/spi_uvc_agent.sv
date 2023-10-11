//////////////////////////////////////////////// 
// File:          spi_uvc_agent.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_AGENT_SV
`define SPI_UVC_AGENT_SV

class spi_uvc_agent extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_agent);

   /** Sequencer instance*/
   spi_uvc_sequencer seqr_h;

   /** Driver instance*/
   spi_uvc_driver drv_h;

   /** Monitor instance*/
   spi_uvc_monitor mon_h;

   /** Coverage instance*/
   spi_uvc_coverage cov_h;

   /** Config class instance*/
   spi_uvc_agent_config agent_cfg_h;

   /** Analysis port for monitor to scoreboard*/
   uvm_analysis_port#(spi_uvc_trans) agent_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_agent",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_agent
`endif //: SPI_UVC_AGENT_SV

   /** Standard UVM Methods*/
   function spi_uvc_agent::new(string name = "spi_uvc_agent",uvm_component parent);
      super.new(name,parent);
      agent_port = new("agent_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving the configuration class*/
      if(!uvm_config_db#(spi_uvc_agent_config)::get(this,"","agent_cfg_h",agent_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the agent config");

      /** As per the config class Active or Passive Agent*/
      if(agent_cfg_h.is_active == UVM_ACTIVE)
      begin
         /** Creating sequencer class*/
         seqr_h = spi_uvc_sequencer::type_id::create("seqr_h",this);

         /** Creating driver class*/
         drv_h = spi_uvc_driver::type_id::create("drv_h",this);
      end/** if*/

      /** Creating monitor class*/
      mon_h = spi_uvc_monitor::type_id::create("mon_h",this);

      /** creating coverage class*/
      if(agent_cfg_h.enable_cov)begin
         cov_h = spi_uvc_coverage::type_id::create("cov_h",this);
      end /** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
      /** If Agent is Active then connect*/
      if(agent_cfg_h.is_active == UVM_ACTIVE)
      begin
         drv_h.seq_item_port.connect(seqr_h.seq_item_export);
      end

      /** Analysis port connection*/
      mon_h.item_collected_port.connect(agent_port);

      if(agent_cfg_h.enable_cov)begin
         mon_h.item_collected_port.connect(cov_h.analysis_export);
      end /** if*/
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_agent::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
