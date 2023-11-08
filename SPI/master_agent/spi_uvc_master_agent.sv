//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_master_agent.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_MASTER_AGENT_SV
`define SPI_UVC_MASTER_AGENT_SV

class spi_uvc_master_agent extends uvm_agent;
   
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_master_agent);

  /** SPI interface instance*/
  virtual spi_uvc_if vif;

  /** SPI reg config instance*/
  spi_uvc_reg_cfg spi_reg_cfg_h;
   
  /** Master sequencer instance*/
  spi_uvc_master_sequencer spi_mstr_seqr_h;

  /** Master driver instance*/
  spi_uvc_master_driver spi_mstr_drv_h;

  /** Master monitor instance*/
  spi_uvc_master_monitor spi_mstr_mon_h;

  /** Master coverage instance*/
  spi_uvc_master_coverage spi_mstr_cov_h;

  /** Master config class instance*/
  spi_uvc_master_cfg spi_mstr_cfg_h;

  /** Analysis port for monitor to scoreboard*/
  uvm_analysis_port#(spi_uvc_transaction) mstr_agent_port;

  /** Standard UVM Methods*/
  extern function new(string name = "spi_uvc_master_agent",uvm_component parent);

  /** Build_phase*/
  extern function void build_phase(uvm_phase phase);

  /** Connect_phase*/
  extern function void connect_phase(uvm_phase phase);
   
  /** Run_phase*/
  extern task run_phase(uvm_phase phase);
endclass : spi_uvc_master_agent
`endif /** SPI_UVC_MASTER_AGENT_SV*/

  /** Standard UVM Methods*/
  function spi_uvc_master_agent::new(string name = "spi_uvc_master_agent",uvm_component parent);
    super.new(name,parent);
    mstr_agent_port = new("mstr_agent_port",this);
  endfunction : new

  /** Build_phase*/
  function void spi_uvc_master_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
       
    /** Retriving the reg configuration classs */
    if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","spi_reg_cfg_h",spi_reg_cfg_h))
      `uvm_fatal(get_full_name(),"not able to get reg config");
      
    /** Retriving the master configuration class*/
    if(!uvm_config_db#(spi_uvc_master_cfg)::get(this,"","spi_mstr_cfg_h",spi_mstr_cfg_h))
      `uvm_fatal(get_full_name(),"Not able to get the master config");
    `uvm_info(get_full_name(),$sformatf("reg_cfg_h.SPICR1 = %0h",spi_reg_cfg_h.SPICR1),UVM_LOW);
        `uvm_info(get_full_name(),$sformatf("reg_cfg_h.SPICR2 = %0h",spi_reg_cfg_h.SPICR2),UVM_LOW);
        `uvm_info(get_full_name(),$sformatf("reg_cfg_h.SPIBR = %0h",spi_reg_cfg_h.SPIBR),UVM_LOW);
        `uvm_info(get_full_name(),$sformatf("reg_cfg_h.SPISR = %0h",spi_reg_cfg_h.SPISR),UVM_LOW);
  
    /** Retriving the virtual interface*/
    if(!uvm_config_db#(virtual spi_uvc_if)::get(this,"","vif",vif))
      `uvm_fatal(get_full_name(),"Not able to get the virtual interface");
         
    /** As per the config class Active or Passive Agent*/
    if(spi_mstr_cfg_h.is_active == UVM_ACTIVE)
    begin
      /** Creating master sequencer class*/
      spi_mstr_seqr_h = spi_uvc_master_sequencer::type_id::create("spi_mstr_seqr_h",this);

      /** Creating master driver class*/
      spi_mstr_drv_h = spi_uvc_master_driver::type_id::create("spi_mstr_drv_h",this);
    end/** if*/

    /** Creating master monitor class*/
    spi_mstr_mon_h = spi_uvc_master_monitor::type_id::create("spi_mstr_mon_h",this);

    /** creating master coverage class*/
    //if(spi_mstr_cfg_h.enable_cov)begin
      spi_mstr_cov_h = spi_uvc_master_coverage::type_id::create("spi_mstr_cov_h",this);
    //end /** if*/

    `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
  endfunction : build_phase

  /** Connect_phase*/
  function void spi_uvc_master_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
    /** If Agent is Active then connect*/
    if(spi_mstr_cfg_h.is_active == UVM_ACTIVE)
    begin
      spi_mstr_drv_h.seq_item_port.connect(spi_mstr_seqr_h.seq_item_export);
      /** Assigning spi interface to driver */
      spi_mstr_drv_h.vif = vif;
      spi_mstr_drv_h.spi_reg_cfg_h = spi_reg_cfg_h;
    end /** if*/

    /** Analysis port connection*/
    spi_mstr_mon_h.item_collected_port.connect(mstr_agent_port);
     
    /** Assigning spi interface to monitor */
    spi_mstr_mon_h.vif = vif;

    //  spi_mstr_mon_h.g = spi_reg_cfg_h;
    /** If the coverage is enabled then connect*/
    //if(spi_mstr_cfg_h.enable_cov)begin
      spi_mstr_mon_h.item_collected_port.connect(spi_mstr_cov_h.analysis_export);
    //end /** if*/
      
    `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
  endfunction : connect_phase
   
  /** Run_phase*/
  task spi_uvc_master_agent::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
    `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
  endtask : run_phase
