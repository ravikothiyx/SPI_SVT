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

   /** Virtual interface instance*/
   virtual spi_uvc_if vif;

   /** Shift register queue*/
   bit sr[$];

   /** Temporary bit to store mosi data*/
   bit temp_mosi;

   /** Flag for the address and data differentiation*/
   bit add;

   /** flag for mode 1 and mode 3 when the address is not available at the
   * first posedge to sample by the slave*/
   bit de;

   /** Register configuration instance class*/
   spi_uvc_reg_cfg reg_cfg_h;

   /** SPI transaction class Instance*/
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

   /** Monitor Task to sample interface transactions*/
   extern task monitor_master_trans(spi_uvc_transaction trans_h);

   /** To sample the transaction */
   extern task sample(spi_uvc_transaction trans_h);

endclass : spi_uvc_slave_monitor
`endif /**: SPI_UVC_SLAVE_MONITOR_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_monitor::new(string name = "spi_uvc_slave_monitor",uvm_component parent);
      super.new(name,parent);
      /** Constructing the analysis port used to connect to the scoreboard*/
      item_collected_port = new("item_collected_port",this);
      /** Constructing the analysis port which is used for ractive agent*/
      item_req_port = new("item_req_port",this);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_slave_monitor::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /** Retriving the register configuration class*/
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
      /**Calling the monitor task*/
       monitor_master_trans(trans_h);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

   /** Monitor Task to sample interface transactions*/
   task spi_uvc_slave_monitor::monitor_master_trans(spi_uvc_transaction trans_h);
      `uvm_info(get_type_name(),"Inside monitor task",UVM_HIGH);
     /** After slave select is asserted then sample*/
      @(negedge vif.ss_n)begin
         /** Initial value is 0 so that at ever transaction the address is get sampled*/
         add = 1'b0;
         forever begin
         `uvm_info(get_type_name(),"Inside forever",UVM_HIGH);

            /** Mode 0 (sampling at posedge)*/
            if(reg_cfg_h.SPICR1[3:2] == 2'b00)begin
              /** To delay sampling by one posedge*/
              if(!de)begin
                 @(posedge vif.sclk);
                 //$display($realtime,"de");
              end
              /** Setting the del bit high so that in the current transaction
                * every time the 1 edge dealy will not be there*/
              de = 1;
              @(posedge vif.sclk)begin
                  /** Calling samplr method to sample data*/
                  sample(trans_h);
              end
                  `uvm_info(get_type_name(),"Slave monitor Mode 0",UVM_HIGH);
            end /** if*/
            
            /** Mode 1 (sampling at negedge)*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b01)begin
               @(negedge vif.sclk)
                  /** Calling sample method to sample data*/
                  sample(trans_h);
                  `uvm_info(get_type_name(),"Slave monitor Mode 1",UVM_HIGH);
            end /** if*/
            
            /** Mode 2 (sampling at negedge)*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b10)begin
              /** To delay sampling by one posedge*/
              if(!de)begin
                 @(negedge vif.sclk);
              end
              de = 1;
               @(negedge vif.sclk)
                  /** Calling sample method to sample data*/
                  sample(trans_h);
                  `uvm_info(get_type_name(),"Slave monitor Mode 2",UVM_HIGH);
            end /** if*/
            
            /** Mode 3 (sampling at posedge)*/
            else if(reg_cfg_h.SPICR1[3:2] == 2'b11)begin
               @(posedge vif.sclk)
                  /** Calling sample method to sample data*/
                  sample(trans_h);
                  `uvm_info(get_type_name(),"Slave monitor Mode 3",UVM_HIGH);
            end /** if*/
         end /** forever*/
      end /** begin*/
   endtask : monitor_master_trans


   /** To sample the transaction */
   task spi_uvc_slave_monitor::sample(spi_uvc_transaction trans_h);
      `uvm_info(get_type_name(),"Inside monitor task",UVM_HIGH);
      /** sampling mosi single bit mosi data and storing into the temp_mosi variable*/
      temp_mosi = vif.mosi;

      /** Storing the sampled mosi bit into the sr(shift register) queue*/ 
      sr.push_back(temp_mosi);

      /** waiting for sr queue to the size of address width*/
      if((sr.size == `ADDR_WIDTH) && (add == 1'b0))begin
         /** setting this bit so when write data is driven then it is not
           * sampled by this block*/
         add = 1'b1;
         `uvm_info(get_type_name(),$sformatf("Slave monitor header in sr queue = %0p",sr),UVM_LOW);
         /** MSB first*/
         if(!reg_cfg_h.SPICR1[0])begin
            /** Storing the sample header into the transaction class header bit by bit*/
            for(int i = `ADDR_WIDTH - 1; i>=0 ;i--)begin
               trans_h.header[i] = sr.pop_front();
            end/** for*/
            /** deleting queue after taking the address*/
            sr.delete();

            /** Checking that transaction type is read then send the read
              * address to the sequencer*/
             if(trans_h.header[7]== 0)begin
                //$display("\t\t\t\tREAD");
               `uvm_info(get_type_name(),"data send",UVM_NONE);
               item_req_port.write(trans_h);
             end /** if*/
         end/** if*/
         
         /** LSB first*/   
         else begin
            /** Storing the sample header into the transaction class header bit by bit*/
            for(int i = 0; i<=`ADDR_WIDTH - 1; i++)begin
               trans_h.header[i] = sr.pop_front();
            end/** for*/
            /** deleting queue after taking the address*/
            sr.delete();
            if(trans_h.header[7]== 0)begin
               `uvm_info(get_type_name(),"data send",UVM_NONE);
               item_req_port.write(trans_h);
            end /** if*/
         end /** else*/
      end /** if*/
      
      /** waiting for sr queue to the size of data width*/
      if(sr.size == `DATA_WIDTH && (add == 1'b1))begin
         `uvm_info(get_type_name(),$sformatf("Slave monitor write data in sr queue = %0p",sr),UVM_LOW);
         /** MSB first*/
         if(!reg_cfg_h.SPICR1[0])begin
            /** Storing the sample write data into the transaction class wr_data bit by bit*/
            for(int i = `DATA_WIDTH - 1; i>=0; i--)begin
               trans_h.rd_data[i] = sr.pop_front();
            end/** for*/
            /** deleting queue after taking the data*/
            sr.delete();

            /** Made add flage low so that in next transaction address can be
              * sampled by the header part*/
            add = 1'b0;
            `uvm_info(get_type_name(),"Before sending transaction to sequencer",UVM_HIGH);
            `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_LOW); 
            /** sending the transaction to the slave_sequencer*/
            if(trans_h.header[7]== 1)
              item_req_port.write(trans_h);
         end/** if*/
         
         /** LSB first*/
         else begin
            /** Storing the sample write data into the transaction class wr_data bit by bit*/
            for(int i = 0; i<`DATA_WIDTH - 1; i++)begin
               trans_h.rd_data[i] = sr.pop_front();
            end/** for*/
            /** Deleting queue after taking the data*/
            sr.delete();
            add = 1'b0;
            `uvm_info(get_type_name(),"Before sending transaction to sequencer",UVM_LOW);
            `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_LOW); 
            /** Sending the transaction to the slave_sequencer*/
            if(trans_h.header[7]== 1)
              item_req_port.write(trans_h);
         end /** else*/
            
            /** Made this bit low when there is 2 or more back to back
              * transaction so to avoid first posedge of the ever transaction*/
            de = 0;
      end /** if*/
   endtask : sample

