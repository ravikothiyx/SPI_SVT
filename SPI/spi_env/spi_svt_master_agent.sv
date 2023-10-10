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
   spi_svt_master_sequencer mseqr_h;

   /** Master driver instance*/
   spi_svt_master_driver mdrv_h;

   /** Master monitor instance*/
   spi_svt_master_monitor mmon_h;

   /** Master coverage instance*/
   spi_svt_master_coverage mcov_h;

   /** Master config class instance*/
   spi_svt_master_config mcfg_h;

   /** Analysis port for monitor to scoreboard*/
   uvm_analysis_port#(spi_svt_trans) a_mport;


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
      a_mport = new("a_mport",this);
   endfunction : new

   /** Build_phase*/
   function void spi_svt_master_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving the configuration class*/
      if(!uvm_config_db#(spi_svt_master_config)::get(this,"","mcfg_h",mcfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the master config");

      /** As per the config class Active or Passive Agent*/
      if(mcfg_h.is_active == UVM_ACTIVE)
      begin
         /** Creating master sequencer class*/
         mseqr_h = spi_svt_master_sequencer::type_id::create("mseqr_h",this);

         /** Creating master driver class*/
         mdrv_h = spi_svt_master_driver::type_id::create("mdrv_h",this);
      end/** if*/

      /** Creating master monitor class*/
      mmon_h = spi_svt_master_monitor::type_id::create("mmon_h",this);

      /** creating master coverage class*/
      if(mcfg_h.enable_cov)begin
         mcov_h = spi_svt_master_coverage::type_id::create("mcov_h",this);
      end /** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_svt_master_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
      /** If Agent is Active then connect*/
      if(mcfg_h.is_active == UVM_ACTIVE)
      begin
         mdrv_h.seq_item_port.connect(mseqr_h.seq_item_export);
      end

      /** Analysis port connection*/
      mmon_h.item_collected_port.connect(a_mport);

      if(mcfg_h.enable_cov)begin
         mmon_h.item_collected_port.connect(mcov_h.analysis_export);
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
