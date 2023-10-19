//////////////////////////////////////////////// 
// File:          spi_uvc_master_monitor.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_MONITOR_SV
`define SPI_UVC_MASTER_MONITOR_SV

class spi_uvc_master_monitor extends uvm_monitor;
   
   /** UVM Factory Registration Macro**/
   `uvm_component_utils(spi_uvc_master_monitor);
   
   /**Declaration for queue array*/
   bit que_mosi[$];
   bit que_miso[$];

   /**Declaration for temporary variable*/
   bit temp_mosi;
   bit temp_miso;

   /** Spi interface instance */
   virtual spi_uvc_if vif;

   /**Sequence item Handle*/
   spi_uvc_transaction trans_h;

   /** Instance of Register config*/
   spi_uvc_reg_cfg reg_cfg_h;

   /** Analysis port for scoreaboard and coverage collector*/
   uvm_analysis_port#(spi_uvc_transaction) item_collected_port;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_master_monitor",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_master_monitor
`endif //: SPI_UVC_MASTER_MONITOR_SV

   /** Standard UVM Methods*/
   function spi_uvc_master_monitor::new(string name = "spi_uvc_master_monitor",uvm_component parent);
      super.new(name,parent);
      item_collected_port = new("item_collected_port",this);
      trans_h = new();
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_master_monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","reg_cfg_h",reg_cfg_h))
        `uvm_fatal(get_full_name(),"Not able to get Register configuration class");
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_master_monitor::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_master_monitor::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);      
      
      forever begin
      
      wait(!vif.rstn);
      @(vif.sclk)
      
      temp_mosi = vif.mosi;
      que_mosi.push_back(temp_mosi);

      temp_miso= vif.miso;
      que_miso.push_back(temp_miso);

      /**Condition:Phase & Polarity both High */
      if(reg_cfg_h.SPICR1[2])begin
        if(reg_cfg_h.SPICR1[3])begin
          @(posedge vif.sclk)
          for(int i=0;i<=7;i++)
          trans_h.header[i]=que_mosi.pop_front();

            /**Check for Write & Read operation, Accordingly we will monitor "wr_data & rd_data"*/
            if(trans_h.header[1])begin
              for(int i=0;i<=7;i++)
              trans_h.wr_data[i]=que_mosi.pop_front();
            end
            else begin
              for(int i=0;i<=7;i++)
              trans_h.rd_data[i]=que_miso.pop_front();
            end
        end
        /**Condition:Phase = 1 & Polarity = 0*/
        else begin
          @(negedge vif.sclk)
          for(int i=0;i<=7;i++)
          trans_h.header[i]=que_mosi.pop_front();
            /**Check for Write & Read operation, Accordingly we will monitor "wr_data & rd_data"*/
            if(trans_h.header[1])begin
              for(int i=0;i<=7;i++)
              trans_h.wr_data[i]=que_mosi.pop_front();
            end
            else begin
              for(int i=0;i<=7;i++)
              trans_h.rd_data[i]=que_miso.pop_front();
            end
        end
      end
      /**Condition:Phase = 0 & Polarity = 0*/
      else begin
        if(!reg_cfg_h.SPICR1[3])begin
          @(posedge vif.sclk)
          for(int i=0;i<=7;i++)
          trans_h.header[i]=que_mosi.pop_front();
            /**Check for Write & Read operation from the first bit of "header"*/
            /**Accordingly we will monitor "wr_data & rd_data"*/
            if(trans_h.header[1])begin
              for(int i=0;i<=7;i++)
              trans_h.wr_data[i]=que_mosi.pop_front();
            end
            else begin
              for(int i=0;i<=7;i++)
              trans_h.rd_data[i]=que_miso.pop_front();
            end
        end
        /**Condition:Phase = 0 & Polarity = 0*/
        else begin
          @(negedge vif.sclk)
          for(int i=0;i<=7;i++)
          trans_h.header[i]=que_mosi.pop_front();
            /**Check for Write & Read operation from the first bit of "header"*/
            /**Accordingly we will monitor "wr_data & rd_data"*/
            if(trans_h.header[1])begin
              for(int i=0;i<=7;i++)
              trans_h.wr_data[i]=que_mosi.pop_front();
            end
            else begin
              for(int i=0;i<=7;i++)
              trans_h.rd_data[i]=que_miso.pop_front();
            end
        end
      end
      item_collected_port.write(trans_h);
      end
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
