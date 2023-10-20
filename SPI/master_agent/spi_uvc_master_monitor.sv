//////////////////////////////////////////////// 
// File:          spi_uvc_master_monitor.sv
// Version:       v1
// Developer:     
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

   /**Declaration for temporary variable*/
   bit temp_mosi;

   /**Flag to differentiate between Address & Data*/
   bit diff_flag;

   /**Spi interface instance */
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
   
   /**Task for sampling interface transaction*/
   extern task mon_to_inf(spi_uvc_transaction trans_h);

   /**Task for sample the transaction*/
   extern task sample(spi_uvc_transaction trans_h);

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
      mon_to_inf(trans_h);
            `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

   /**mon_to_inf task to sample interface transactions*/
   task spi_uvc_master_monitor::mon_to_inf(spi_uvc_transaction trans_h);
      `uvm_info(get_type_name(),"Inside mon_to_inf task",UVM_HIGH);
      forever begin

            /**SPICR1[2]:CPHASE(Phase) =0 & SPICR1[3]:CPOl(Polarity) =0*/
            if(reg_cfg_h.SPICR1[3:2] == 2'b00)begin
               @(posedge vif.sclk)
                  sample(trans_h);
            end /**else if*/

            /**SPICR1[2]:CPHASE(Phase) =0 & SPICR1[3]:CPOl(Polarity) =1*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b01)begin
               @(negedge vif.sclk)
                  sample(trans_h);
            end /**else if*/

            /**SPICR1[2]:CPHASE(Phase) =1 & SPICR1[3]:CPOl(Polarity) =0*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b10)begin
               @(negedge vif.sclk)
                  sample(trans_h);
            end /**else if*/

            /**SPICR1[2]:CPHASE(Phase) =1 & SPICR1[3]:CPOl(Polarity) =1*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b11)begin
               @(posedge vif.sclk)
                  sample(trans_h);
            end /**else if*/
      end /** forever*/
   endtask : mon_to_inf

   /**Sample task for sampling the transaction*/
   task spi_uvc_master_monitor::sample(spi_uvc_transaction trans_h);

      /**Taking temporary variable "temp_mosi" and assigning it "mosi" signal from the interface*/
      temp_mosi = vif.mosi;

      /**Storing mosi data(temp_mosi) into the queue array - que_mosi*/
      que_mosi.push_back(temp_mosi);
      
      /**Condition: When queue array is equal size of "Address width"*/
      if(que_mosi.size == `ADDR_WIDTH && (diff_flag ==0))begin
        diff_flag=1'b1;
        /**SPICR[0]=0: MSB Bit first*/
        if(!reg_cfg_h.SPICR1[0])begin
          for(int i=`ADDR_WIDTH;i>0;i--)begin
            trans_h.header[i]=que_mosi.pop_front();
          end/**for*/
          `uvm_info(get_type_name(),$sformatf("trans_h.header = %0b",trans_h.header),UVM_HIGH);
          que_mosi.delete();
          diff_flag=1'b1;
        end/**if*/

        /**SPICR[0]=1: LSB Bit first*/
        else begin
        for(int i=0;i<`ADDR_WIDTH-1;i++)begin
         trans_h.header[i]=que_mosi.pop_front();
         `uvm_info(get_type_name(),"Master monitor header",UVM_HIGH);
        end/**for*/
        `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_HIGH);
        que_mosi.delete();
        end/**else*/
      end/**if*/
      
      /**Condition: When queue array is equal size of "Data width"*/
      if(que_mosi.size == `DATA_WIDTH && (diff_flag ==1))begin
        
        /**SPICR[0]=0: MSB Bit first*/
         if(!reg_cfg_h.SPICR1[0])begin
            for(int i = `DATA_WIDTH - 1; i>0; i--)begin
               trans_h.wr_data[i] = que_mosi.pop_front();
              `uvm_info(get_type_name(),"Master monitor write data",UVM_HIGH);
            end/**for*/
            `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_HIGH);
            que_mosi.delete();
            diff_flag = 1'b0;
         end/**if*/

        /**SPICR[0]=1: LSB Bit first*/
         else begin
            for(int i = 0; i<`DATA_WIDTH; i++)begin
               trans_h.wr_data[i] = que_mosi.pop_front();
            end/**for*/
            `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_HIGH);
            que_mosi.delete();
            diff_flag = 1'b0;
         end/**else*/

      end/**wait*/
      item_collected_port.write(trans_h);
   endtask:sample


