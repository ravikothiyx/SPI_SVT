//////////////////////////////////////////////// 
// File:          spi_svt_slave_agent.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_SVT_SLAVE_AGENT_SV
`define SPI_SVT_SLAVE_AGENT_SV

class spi_svt_slave_agent extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_slave_agent);

   /**slave sequencer instance*/
   spi_svt_slave_sequencer sseqr_h;

   /**slave driver instance*/
   spi_svt_slave_driver sdrv_h;

   /**slave monitor instance**/
   spi_svt_slave_monitor smon_h;

   /**salve config class instance*/
   spi_svt_slave_config scfg_h;

   /**slave coverage instance**/
   spi_svt_slave_coverage scov_h;

   /**slave config class instance*/
   spi_svt_slave_config scvg_h;

   /**Analysis port*/
   uvm_analysis_port#(spi_svt_trans) a_sport;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_svt_slave_agent",uvm_component parent);

   /**build_phase*/
   extern function void build_phase(uvm_phase phase);

   /**connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /**run_phase*/
   extern task run_phase(uvm_phase phase);
endclass : spi_svt_slave_agent
`endif /**: SPI_SVT_SLAVE_AGENT_SV*/

   /** Standard UVM Methods*/
   function spi_svt_slave_agent::new(string name = "spi_svt_slave_agent",uvm_component parent);
      super.new(name,parent);
      a_sport = new("a_sport",this);
   endfunction : new

   /**build_phase*/
   function void spi_svt_slave_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /**getting the config class*/
      if(!uvm_config_db#(spi_svt_slave_config)::get(this,"","scfg_h",scfg_h))
         `uvm_fatal(get_full_name,"Not able to get the slave config");

      /**Checking Agent is ACTIVE or PASSIVE(ACTIVE then create)*/
      if(scfg_h.is_active == UVM_ACTIVE) begin
         /**creating slave sequencer class*/
         sseqr_h = spi_svt_slave_sequencer::type_id::create("sseqr_h",this);

         /**creating slave driver class*/
         sdrv_h = spi_svt_slave_driver::type_id::create("sdrv_h",this);
      end

      /**creating slave monitor class*/
      smon_h = spi_svt_slave_monitor::type_id::create("smon_h",this);


      /** creating slave coverage class*/
      if(scfg_h.enable_cov)begin
         scov_h = spi_svt_slave_coverage::type_id::create("scov_h",this);
      end/** if*/

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /**connect_phase*/
   function void spi_svt_slave_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      
      /**Chekcing of Agent is ACTIVE or PASSive and then connect*/
      if(scfg_h.is_active == UVM_ACTIVE) begin
         sdrv_h.seq_item_port.connect(sseqr_h.seq_item_export);
      end 

      //Analysis port connection
      smon_h.item_collected_port.connect(a_sport);
      if(scfg_h.enable_cov)begin
         smon_h.item_collected_port.connect(scov_h.analysis_export);
      end /** if*/

      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**run_phase*/
   task spi_svt_slave_agent::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

