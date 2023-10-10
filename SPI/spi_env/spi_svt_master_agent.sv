//////////////////////////////////////////////// 
// File:          spi_svt_master_agent.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`ifndef SPI_SVT_MASTER_AGENT_SV
`define SPI_SVT_MASTER_AGENT_SV

class spi_svt_master_agent extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_master_agent);

   /** Master sequencer instance*/
   spi_svt_master_sequencer mstr_seqr_h;

   /** Master driver instance*/
   spi_svt_master_driver mstr_drv_h;

   /** Master monitor instance*/
   spi_svt_master_monitor mstr_mon_h;

   /** Master coverage instance*/
   spi_svt_master_coverage mstr_cov_h;

   /** Master config class instance*/
   spi_svt_master_config mstr_cfg_h;

   /** Analysis port for monitor to scoreboard*/
   uvm_analysis_port#(spi_svt_trans) mstr_agent_port;


   /** Standard UVM Methods*/
   extern function new(string name = "spi_svt_master_agent",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_svt_master_agent
`endif //: SPI_SVT_MASTER_AGENT_SV

   /** Standard UVM Methods*/
   function spi_svt_master_agent::new(string name = "spi_svt_master_agent",uvm_component parent);
      super.new(name,parent);
      mstr_agent_port = new("mstr_agent_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_svt_master_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving the configuration class*/
      if(!uvm_config_db#(spi_svt_master_config)::get(this,"","mstr_cfg_h",mstr_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the master config");

      /** As per the config class Active or Passive Agent*/
      if(mstr_cfg_h.is_active == UVM_ACTIVE)
      begin
         /** Creating master sequencer class*/
         mstr_seqr_h = spi_svt_master_sequencer::type_id::create("mstr_seqr_h",this);

         /** Creating master driver class*/
         mstr_drv_h = spi_svt_master_driver::type_id::create("mstr_drv_h",this);
      end/** if*/

      /** Creating master monitor class*/
      mstr_mon_h = spi_svt_master_monitor::type_id::create("mstr_mon_h",this);

      /** creating master coverage class*/
      if(mstr_cfg_h.enable_cov)begin
         mstr_cov_h = spi_svt_master_coverage::type_id::create("mstr_cov_h",this);
      end /** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_svt_master_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
      /** If Agent is Active then connect*/
      if(mstr_cfg_h.is_active == UVM_ACTIVE)
      begin
         mstr_drv_h.seq_item_port.connect(mstr_seqr_h.seq_item_export);
      end

      /** Analysis port connection*/
      mstr_mon_h.item_collected_port.connect(mstr_agent_port);

      if(mstr_cfg_h.enable_cov)begin
         mstr_mon_h.item_collected_port.connect(mstr_cov_h.analysis_export);
      end /** if*/
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_svt_master_agent::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
