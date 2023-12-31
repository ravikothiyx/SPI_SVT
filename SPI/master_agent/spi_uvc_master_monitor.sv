//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_master_monitor.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_MONITOR_SV
`define SPI_UVC_MASTER_MONITOR_SV

class spi_uvc_master_monitor extends uvm_monitor;
   
  /** UVM Factory Registration Macro**/
  `uvm_component_utils(spi_uvc_master_monitor);
   
  /** Declaration for queue array*/
  bit que_mosi[$];
  bit que_miso[$];

  /** Declaration for temporary variable*/
  bit temp_mosi;
  bit temp_miso;

  /** Flag to differentiate between Address & Data*/
  bit diff_flag;

  /** Flag is used to give initial dealy in mode 0 and mode 3*/
  bit delay_for_mode_sync;

  /** Flag is to detect the type of the transaction(write and read)*/
  bit miso_s;

  /** Spi interface instance */
  virtual spi_uvc_if vif;

  /**Sequence item Handle*/
  spi_uvc_transaction spi_trans_h;

  /** Instance of Register configuration*/
  spi_uvc_reg_cfg spi_reg_cfg_h;

  /** Instnace of master configuration*/
  spi_uvc_master_cfg spi_mstr_cfg_h;

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
  extern task inf_to_mon(spi_uvc_transaction spi_trans_h);

  /**Task for sample the transaction*/
  extern task sample(spi_uvc_transaction spi_trans_h);

endclass : spi_uvc_master_monitor
`endif //: SPI_UVC_MASTER_MONITOR_SV

  /** Standard UVM Methods*/
  function spi_uvc_master_monitor::new(string name = "spi_uvc_master_monitor",uvm_component parent);
    super.new(name,parent);
    item_collected_port = new("item_collected_port",this);
    spi_trans_h = new();
  endfunction : new

  /** Build_phase*/
  function void spi_uvc_master_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

    /** Retriving the register configuration*/
    if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","spi_reg_cfg_h",spi_reg_cfg_h))
      `uvm_fatal(get_full_name(),"Not able to get Register configuration class");
    
    /** Retriving the master configuration class*/
    if(!uvm_config_db#(spi_uvc_master_cfg)::get(this,"","spi_mstr_cfg_h",spi_mstr_cfg_h))
      `uvm_fatal(get_full_name(),"Not able to get the master config");
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
    
    /**  Metohd to sample data from the interface*/
    inf_to_mon(spi_trans_h);
    `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
  endtask : run_phase

  /** inf_to_mon task to sample interface transactions*/
  task spi_uvc_master_monitor::inf_to_mon(spi_uvc_transaction spi_trans_h);
    `uvm_info(get_type_name(),"Inside inf_to_mon task",UVM_HIGH);
    @(negedge vif.ss_n)begin
      /**SPICR1[4]: It represents MSTR bit as per the specifications*/
      /**Where 1= Master mode & 0 = Slave mode */
      if(spi_reg_cfg_h.SPICR1[4] == 1'b1)begin
        spi_trans_h.mstr_mode_h = MASTER_MODE;
      end
      
      /** Initial value to the flag for new transaction*/
      diff_flag = 1'b0;
      miso_s = 1'b0;
      
      forever begin
        /**SPICR1[2]:CPHASE(Phase) =0 & SPICR1[3]:CPOl(Polarity) =0*/
        if(spi_reg_cfg_h.SPICR1[3:2] == 2'b00)begin
              
          spi_trans_h.mode_h = MODE_00;
          
          /** To delay sampling by one posedge*/
          if(!delay_for_mode_sync)
            @(posedge vif.sclk);
              if(!vif.ss_n)begin
                /** Setting the del bit high so that in the current transaction
                  * every time the 1 edge dealy will not be there*/
                delay_for_mode_sync = 1;
              end /** if*/
              else 
                 `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
              @(posedge vif.sclk)
                if(!vif.ss_n)begin
                  sample(spi_trans_h);
                end /** if*/
                else 
                  `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
          end /**else if*/

          /**SPICR1[2]:CPHASE(Phase) =0 & SPICR1[3]:CPOl(Polarity) =1*/
          else if(spi_reg_cfg_h.SPICR1[3:2] == 2'b01)begin
            spi_trans_h.mode_h = MODE_01;
              
            @(negedge vif.sclk)
              if(!vif.ss_n)begin
                sample(spi_trans_h);
              end /** if*/
              else 
                `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
          end /**else if*/

          /**SPICR1[2]:CPHASE(Phase) =1 & SPICR1[3]:CPOl(Polarity) =0*/
          else if(spi_reg_cfg_h.SPICR1[3:2] == 2'b10)begin
            spi_trans_h.mode_h = MODE_10;
              if(!delay_for_mode_sync)
                if(!vif.ss_n)begin
                  @(negedge vif.sclk);
                    delay_for_mode_sync = 1;
                end /** if*/
                else 
                  `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
                @(negedge vif.sclk)
                  if(!vif.ss_n)begin
                    sample(spi_trans_h);
                  end /** if*/
                  else 
                    `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
          end /**else if*/

          /**SPICR1[2]:CPHASE(Phase) =1 & SPICR1[3]:CPOl(Polarity) =1*/
          else if(spi_reg_cfg_h.SPICR1[3:2] == 2'b11)begin
            spi_trans_h.mode_h = MODE_11;
              @(posedge vif.sclk)
                if(!vif.ss_n)begin
                  sample(spi_trans_h);
                end /** if*/
                else 
                  `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
          end /**else if*/
      end /** forever*/
    end /** begin*/
  endtask : inf_to_mon

  /** Sample task for sampling the transaction*/
  task spi_uvc_master_monitor::sample(spi_uvc_transaction spi_trans_h);

    /** This flag used to detect the write or read transaction*/
    if(miso_s == 1'b0)begin
      /** Taking temporary variable "temp_mosi" and assigning it "mosi" signal from the interface*/
      // temp_mosi = vif.mosi;

      /**Storing mosi data(temp_mosi) into the queue array - que_mosi*/
      que_mosi.push_back(vif.mosi);
    end /** if*/

    /** This flag used to detect the write or read transaction*/
    if(miso_s == 1'b1)begin
      /**Taking temporary variable "temp_miso" and assigning it "miso" signal from the interface*/
      //   temp_miso = vif.miso;
      /**Storing mosi data(temp_miso) into the queue array - que_mosi*/
      que_miso.push_back(vif.miso);
    end /** if*/

    /**Condition: When queue array is equal size of "Address width"*/
    if(que_mosi.size == `ADDR_WIDTH && (diff_flag ==0))begin
      diff_flag=1'b1;
      `uvm_info(get_type_name()," Master monitor header",UVM_HIGH);
      
      /**SPICR[0]=0: MSB Bit first*/
      if(!spi_reg_cfg_h.SPICR1[0])begin
        spi_trans_h.lsb_msb_h = MSB_FIRST;
        `uvm_info(get_type_name(),$sformatf(" Header_que_mosi = %0p",que_mosi),UVM_NONE);
        for(int i=`ADDR_WIDTH-1;i>=0;i--)begin
          spi_trans_h.header[i]=que_mosi.pop_front();
        end/**for*/
        `uvm_info(get_type_name(),$sformatf(" Trans_h.header = %0b",spi_trans_h.header),UVM_NONE);
        que_mosi.delete();
      end/**if*/

      /**SPICR[0]=1: LSB Bit first*/
      else begin
        spi_trans_h.lsb_msb_h = LSB_FIRST;
        for(int i=0;i<=`ADDR_WIDTH-1;i++)begin
          spi_trans_h.header[i]=que_mosi.pop_front();
        end/**for*/
        `uvm_info(get_type_name(),$sformatf(" Header_que_mosi = %0p",que_mosi),UVM_NONE);
        que_mosi.delete();
      end/**else*/
         
      if(spi_trans_h.header[7]==1'b0)
        miso_s = 1'b1;
      end/**if*/
      
      /**Condition: When queue array(que_mosi) is equal size of "Data width"*/
      if(que_mosi.size == `DATA_WIDTH && (diff_flag ==1)&&(spi_trans_h.header[7]==1'b1))begin
      /**SPICR[0]=0: MSB Bit first*/
        if(!spi_reg_cfg_h.SPICR1[0])begin
          spi_trans_h.lsb_msb_h = MSB_FIRST;
          `uvm_info(get_type_name(),"Master monitor write data",UVM_HIGH);
          `uvm_info(get_type_name(),$sformatf(" Data_que_mosi=%0p",que_mosi),UVM_NONE);
          for(int i = `DATA_WIDTH - 1; i>=0; i--)begin
            spi_trans_h.wr_data[i] = que_mosi.pop_front();
          end/**for*/
          que_mosi.delete();

           /** After the write data is sampled then the header is sampled so
             * the flags are zero*/
           diff_flag = 1'b0;
           delay_for_mode_sync = 0;
           item_collected_port.write(spi_trans_h);
        end/**if*/

        /**SPICR[0]=1: LSB Bit first*/
        else begin
          spi_trans_h.lsb_msb_h = LSB_FIRST ;
          `uvm_info(get_type_name(),$sformatf(" Data_que_mosi=%0p",que_mosi),UVM_NONE);
          for(int i = 0; i<`DATA_WIDTH-1; i++)begin
            spi_trans_h.wr_data[i] = que_mosi.pop_front();
          end/**for*/
          
          /** After the write data is sampled then the header is sampled so
            * the flags are zero*/
          que_mosi.delete();
          diff_flag = 1'b0;
          delay_for_mode_sync = 0;
          item_collected_port.write(spi_trans_h);
        end/**else*/
      end/**wait*/

      /**Condition: When queue array(que_miso) is equal size of "Data width"*/
      if((que_miso.size == `DATA_WIDTH) && (diff_flag ==1)&&(spi_trans_h.header[7]==1'b0))begin
        
        /**SPICR[0]=0: MSB Bit first*/
        if(!spi_reg_cfg_h.SPICR1[0])begin
          spi_trans_h.lsb_msb_h = MSB_FIRST ;
          `uvm_info(get_type_name(),$sformatf(" Data_que_miso = %0p",que_miso),UVM_NONE);
          
          for(int i = `DATA_WIDTH - 1; i>=0; i--)begin
            spi_trans_h.rd_data[i] = que_miso.pop_front();
            `uvm_info(get_type_name(),"Master monitor read data",UVM_HIGH);
          end/**for*/
          
          que_miso.delete();
          /** After the read data is sampled then the header is sampled so
            * the flags are zero*/
          delay_for_mode_sync = 0;
          diff_flag = 1'b0;
          miso_s = 1'b0;
          item_collected_port.write(spi_trans_h);
        end/**if*/

        /**SPICR[0]=1: LSB Bit first*/
        else begin
          spi_trans_h.lsb_msb_h = LSB_FIRST ;
          for(int i = 0; i<`DATA_WIDTH-1; i++)begin
            spi_trans_h.rd_data[i] = que_miso.pop_front();
          end/**for*/
          `uvm_info(get_type_name(),$sformatf(" Data_que_miso = %0p",que_miso),UVM_NONE);
          que_miso.delete();
          
          /** After the read data is sampled then the header is sampled so
            * the flags are zero*/
          delay_for_mode_sync = 0;
          diff_flag = 1'b0;
          miso_s = 1'b0;
          item_collected_port.write(spi_trans_h);
        end/**else*/
      end/** else if*/
   endtask:sample