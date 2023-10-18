//////////////////////////////////////////////// 
// File:          spi_uvc_slave_agent.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_AGENT_SV
`define SPI_UVC_SLAVE_AGENT_SV

class spi_uvc_slave_agent extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_slave_agent);

   /** SPI interface instance */
   virtual spi_uvc_if vif;

   /**slave sequencer instance*/
   spi_uvc_slave_sequencer slv_seqr_h;

   /**slave driver instance*/
   spi_uvc_slave_driver slv_drv_h;

   /**slave monitor instance**/
   spi_uvc_slave_monitor slv_mon_h;

   /**salve config class instance*/
   spi_uvc_slave_cfg slv_cfg_h;

   /**slave coverage instance**/
   spi_uvc_slave_coverage slv_cov_h;

   /**Analysis port*/
   uvm_analysis_port#(spi_uvc_transaction) slv_agent_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_agent",uvm_component parent);

   /**build_phase*/
   extern function void build_phase(uvm_phase phase);

   /**connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /**run_phase*/
   extern task run_phase(uvm_phase phase);
endclass : spi_uvc_slave_agent
`endif /**: SPI_UVC_SLAVE_AGENT_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_agent::new(string name = "spi_uvc_slave_agent",uvm_component parent);
      super.new(name,parent);
      slv_agent_port = new("slv_agent_port",this);
   endfunction : new

   /**build_phase*/
   function void spi_uvc_slave_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /**getting the config class*/
      if(!uvm_config_db#(spi_uvc_slave_cfg)::get(this,"","slv_cfg_h",slv_cfg_h))
         `uvm_fatal(get_full_name,"Not able to get the slave config");
      
       /** Retriving the virtual interface*/
      if(!uvm_config_db#(virtual spi_uvc_if)::get(this,"","vif",vif))
         `uvm_fatal(get_full_name,"Not able to get the virtual interface");

      /**Checking Agent is ACTIVE or PASSIVE(ACTIVE then create)*/
      if(slv_cfg_h.is_active == UVM_ACTIVE) begin
         /**creating slave sequencer class*/
         slv_seqr_h = spi_uvc_slave_sequencer::type_id::create("slv_seqr_h",this);

         /**creating slave driver class*/
         slv_drv_h = spi_uvc_slave_driver::type_id::create("slv_drv_h",this);
      end

      /**creating slave monitor class*/
      slv_mon_h = spi_uvc_slave_monitor::type_id::create("slv_mon_h",this);

      /** creating slave coverage class*/
      if(slv_cfg_h.enable_cov)begin
         slv_cov_h = spi_uvc_slave_coverage::type_id::create("slv_cov_h",this);
      end/** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /**connect_phase*/
   function void spi_uvc_slave_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
      /**Chekcing of Agent is ACTIVE or PASSive and then connect*/
      if(slv_cfg_h.is_active == UVM_ACTIVE) begin
         slv_drv_h.seq_item_port.connect(slv_seqr_h.seq_item_export);
         
         /** Assigning spi interface to driver */
         slv_drv_h.vif = vif;
      end 

      //Analysis port connection
      slv_mon_h.item_collected_port.connect(slv_agent_port);

      /** Assigning spi interface to monitor */
      slv_mon_h.vif = vif;

      if(slv_cfg_h.enable_cov)begin
         slv_mon_h.item_collected_port.connect(slv_cov_h.analysis_export);
      end /** if*/
      slv_mon_h.item_req_port.connect(slv_seqr_h.item_export);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**run_phase*/
   task spi_uvc_slave_agent::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
