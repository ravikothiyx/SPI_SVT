//////////////////////////////////////////////// 
// File:          spi_uvc_slave_monitor.sv
// Version:       v1
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_MONITOR_SV
`define SPI_UVC_SLAVE_MONITOR_SV

class spi_uvc_slave_monitor extends uvm_monitor;
   
   /** UVM Factory Registration Macro**/
   `uvm_component_utils(spi_uvc_slave_monitor);

   /** Virtual interface instance */
   virtual spi_uvc_if vif;

   /** Shift register */
   bit[`DATA_WIDTH:0] sr;

   /** Register configuration instance class */
   spi_uvc_reg_cfg reg_cfg_h;

   /** SPI transaction class Instance */
   spi_uvc_transaction trans_h;

   /** Analysis port for scoreaboard and coverage collector*/
   uvm_analysis_port#(spi_uvc_transaction) item_collected_port;

   /** Analysis port for reactive agent*/
   uvm_analysis_port#(spi_uvc_transaction) item_req_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_monitor",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

   /** Monitor Task to sample interface transactions */
   extern task monitor_master_data(spi_uvc_transaction trans_h);

   /** To sample the transaction */
   extern task sample(spi_uvc_transaction trans_h);

endclass : spi_uvc_slave_monitor
`endif /**: SPI_UVC_SLAVE_MONITOR_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_monitor::new(string name = "spi_uvc_slave_monitor",uvm_component parent);
      super.new(name,parent);
      item_collected_port = new("item_collected_port",this);
      item_req_port = new("item_req_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_slave_monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","reg_cfg_h",reg_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the register configuration class");

      /** Transaction class Creation*/
      trans_h = spi_uvc_transaction::type_id::create("trans_h");
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_slave_monitor::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_slave_monitor::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
       monitor_master_data(trans_h);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

   /** Monitor Task to sample interface transactions */
   task spi_uvc_slave_monitor::monitor_master_data(spi_uvc_transaction trans_h);
      forever begin
         @(negedge vif.ss_n)begin

            /** Mode 0 (sampling at posedge) */
            if(reg_cfg_h.SPICR1[3:2] == 2'b00)begin
               @(posedge vif.sclk)
                  sample(trans_h);
            end //if
            
            /** Mode 1 (sampling at negedge) */
            else if(reg_cfg_h.SPICR1[3:2] == 2'b01)begin
               @(negedge vif.sclk)
                  sample(trans_h);
            end //if
            
            /** Mode 2 (sampling at negedge) */
            else if(reg_cfg_h.SPICR1[3:2] == 2'b10)begin
               @(negedge vif.sclk)
                  sample(trans_h);
            end //if
            
            /** Mode 3 (sampling at posedge) */
            else if(reg_cfg_h.SPICR1[3:2] == 2'b01)begin
               @(posedge vif.sclk)
                  sample(trans_h);
            end //if
            item_req_port.write(trans_h);
         end // begin
      end // forever
   endtask : monitor_master_data


   /** To sample the transaction */
   task spi_uvc_slave_monitor::sample(spi_uvc_transaction trans_h);

   endtask : sample

