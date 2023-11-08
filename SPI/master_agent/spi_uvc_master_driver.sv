//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_master_driver.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_DRIVER_SV
`define SPI_UVC_MASTER_DRIVER_SV

class spi_uvc_master_driver extends uvm_driver #(spi_uvc_transaction);
   
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_master_driver);

  /** Spi interface instance */
  virtual spi_uvc_if vif;

  /** Instance of Register config*/
  spi_uvc_reg_cfg spi_reg_cfg_h;

  int baudrate_divisor;

  /** Standard UVM Methods*/
  extern function new(string name = "spi_uvc_master_driver",uvm_component parent);

  /** Build_phase*/
  extern function void build_phase(uvm_phase phase);

  /** Connect_phase*/
  extern function void connect_phase(uvm_phase phase);
   
  /** Run_phase*/
  extern task run_phase(uvm_phase phase);

  /** Driving on posedge with msb first*/
  extern task msb_first_drv_posedge();

  /** Driving on negedge with msb first*/
  extern task msb_first_drv_negedge();

  /** Driving on posedge with lsb first*/
  extern task lsb_first_drv_posedge();

  /** Driving on negedge with lsb first*/
  extern task lsb_first_drv_negedge();

endclass : spi_uvc_master_driver
`endif /** SPI_UVC_MASTER_DRIVER_SV*/

  /** Standard UVM Methods*/
  function spi_uvc_master_driver::new(string name = "spi_uvc_master_driver",uvm_component parent);
    super.new(name,parent);
  endfunction : new

  /** Build_phase*/
  function void spi_uvc_master_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_MEDIUM);
    `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_MEDIUM);
  endfunction : build_phase

  /** Connect_phase*/
  function void spi_uvc_master_driver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_MEDIUM);
    `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
    `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_MEDIUM);
  endfunction : connect_phase
   
  /** Run_phase*/
  task spi_uvc_master_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_MEDIUM);

     /** Initialize the sclk*/
     vif.sclk <= spi_reg_cfg_h.SPICR1[3]; 
     vif.mosi <= 1'bz;
     `uvm_info(get_type_name(),"AFTER WAIT ",UVM_MEDIUM);
     forever begin
       wait(vif.rstn);
       
       fork : init
         begin
           wait(!vif.rstn);
         end

         forever begin
           if(spi_reg_cfg_h.SPICR1[6]) begin /** Checking for SPI enable bit(SPE)*/
             `uvm_info(get_type_name(),$sformatf("SPICR1 = %0b",spi_reg_cfg_h.SPICR1),UVM_MEDIUM)
             seq_item_port.get_next_item(req);
             @(posedge vif.bclk);
             vif.ss_n <= 0; /** Enable The Slave Select pin*/
             `uvm_info(get_type_name(),"AFTEr get_next_item ",UVM_MEDIUM);

             /** Clock Generation*/
             @(posedge vif.bclk);
             baudrate_divisor = (((spi_reg_cfg_h.SPIBR[6:4]) + 1)*((32'b1)<<((spi_reg_cfg_h.SPIBR[2:0]) + 1)));
             `uvm_info(get_type_name(),$sformatf("baudrate = %0d",baudrate_divisor),UVM_MEDIUM)
             fork : clock
               while(!vif.ss_n) begin
                 if(spi_reg_cfg_h.SPICR1[3]) begin
                   vif.sclk <= 1;
                   repeat(baudrate_divisor) @(edge vif.bclk);
                   vif.sclk <= 0;
                   repeat(baudrate_divisor) @(edge vif.bclk);
                 end /** if*/
                 else begin
                   vif.sclk <= 0;
                   repeat(baudrate_divisor) @(edge vif.bclk);
                   vif.sclk <= 1;
                   repeat(baudrate_divisor) @(edge vif.bclk);
                 end /** else*/
               end /** while*/
             join_none

             if(spi_reg_cfg_h.SPICR1[2]) begin /** Checking for wr/rd at odd edges(CPHA)*/
               if(spi_reg_cfg_h.SPICR1[3]) begin /** Checking For negedge/posedge first(CPOL)*/
                 if(!spi_reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                   msb_first_drv_negedge();
                 end /** CPHA=1;CPOL=1;MSB*/

                 else begin
                   lsb_first_drv_negedge();
                 end /** CPHA=1;CPOL=1;LSB*/
               end /** CPHA=1;CPOL=1*/ 

               else begin
                 if(!spi_reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                   msb_first_drv_posedge();
                 end /** CPHA=1;CPOL=0;MSB*/

                 else begin
                   lsb_first_drv_posedge();
                 end /** CPHA=1;CPOL=0;LSB*/
               end /** CPHA=1;CPOL=0*/
             end /** CPHA=1*/

             else begin
               if(spi_reg_cfg_h.SPICR1[3]) begin /** Checking For negedge/posedge first*/
                 if(!spi_reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                   msb_first_drv_posedge();                    
                   repeat(2*baudrate_divisor) @(edge vif.bclk);
                 end /** CPHA=0;CPOL=1;MSB*/

                 else begin
                   lsb_first_drv_posedge();
                   repeat(2*baudrate_divisor) @(edge vif.bclk);
                 end /** CPHA=0;CPOL=1;LSB*/
               end /** CPHA=0;CPOL=1*/

               else begin
                 if(!spi_reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                   msb_first_drv_negedge();
                   repeat(2*baudrate_divisor) @(edge vif.bclk);
                 end /**CPHA=0;CPOL=0;MSB*/

                 else begin
                   lsb_first_drv_negedge();
                   repeat(2*baudrate_divisor) @(edge vif.bclk);
                 end /**CPHA=0;CPOL=0;LSB*/
               end /** CPHA=0;CPOL=0*/
             end /** CPHA=1*/
             @(posedge vif.bclk) vif.sclk <= spi_reg_cfg_h.SPICR1[3];
             disable clock;
             @(posedge vif.bclk) vif.ss_n <= 1'b1;
             //vif.mosi <= 1'bz;
             seq_item_port.item_done();
           end /** if*/
           else begin
             vif.sclk <= spi_reg_cfg_h.SPICR1[3];
             vif.ss_n <= 1'b1;
             vif.mosi <= 1'bz;
           end /** else*/
         end /** forever*/ 
        join_any
        disable init;
        `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_MEDIUM);
      end /** forever*/
  endtask : run_phase

  /** msb first driving on posedge*/
  task spi_uvc_master_driver::msb_first_drv_posedge();
    foreach(req.header[i]) begin
      @(posedge vif.sclk)
      if(!vif.ss_n)begin
        vif.mosi <= req.header[i];
      end /** if*/
      else 
         `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
    end /** foreach*/
    
    if(req.header[7]) begin
      foreach(req.wr_data[i]) begin
        @(posedge vif.sclk)
          if(!vif.ss_n)begin
            vif.mosi <= req.wr_data[i];
          end /** if*/
          else 
            `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
      end /** foreach*/

      fork
        begin 
          repeat(2*baudrate_divisor) @(edge vif.bclk);
          vif.mosi <= 1'bz;
        end /** begin*/
       join_none
    end /** if*/

    else begin
      foreach(req.wr_data[i]) begin
        @(posedge vif.sclk)
        vif.mosi <= 1'bz;
      end /** foreach*/
    end /** else*/
  endtask : msb_first_drv_posedge

  /** msb first driving on negedge*/
  task spi_uvc_master_driver::msb_first_drv_negedge();
    foreach(req.header[i]) begin
      @(negedge vif.sclk)
      if(!vif.ss_n)begin
        vif.mosi <= req.header[i];
      end /** if*/
      else 
         `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
    end /** forech*/

    if(req.header[7]) begin
      foreach(req.wr_data[i]) begin
        @(negedge vif.sclk)
          if(!vif.ss_n)begin
            vif.mosi <= req.wr_data[i];
          end
          else 
            `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
      end /** foreach*/
       
      fork 
        begin
          repeat(2*baudrate_divisor) @(edge vif.bclk);
          vif.mosi <= 1'bz;
       end /** begin*/
      join_none
    end /** if*/

    else begin
      foreach(req.wr_data[i]) begin
        @(negedge vif.sclk)
        vif.mosi <= 1'bz;
      end /** foreach*/
    end /** else*/
  endtask : msb_first_drv_negedge

  /** lsb first driving on posedge*/
  task spi_uvc_master_driver::lsb_first_drv_posedge();
    foreach(req.header[i]) begin
      @(posedge vif.sclk)
        if(!vif.ss_n)begin
          vif.mosi <= req.header[(`ADDR_WIDTH - 1) - i];
        end /** if*/
        else 
          `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
    end /** foreach*/
     
    if(req.header[7]) begin
      foreach(req.wr_data[i]) begin
        @(posedge vif.sclk)
        if(!vif.ss_n)begin
          vif.mosi <= req.wr_data[(`ADDR_WIDTH - 1) - i];
        end /** if*/
        else 
          `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
      end /** foreach*/
      fork 
        begin
          repeat(2*baudrate_divisor) @(edge vif.bclk);
          vif.mosi <= 1'bz;
       end /** begin*/
      join_none
    end /** if*/

    else begin
      foreach(req.wr_data[i]) begin
        @(posedge vif.sclk)
          vif.mosi <= 1'bz;
      end /** foreach*/
    end /** else*/
  endtask : lsb_first_drv_posedge

  /** lsb first driving on negedge*/
  task spi_uvc_master_driver::lsb_first_drv_negedge();
    foreach(req.header[i]) begin
      @(negedge vif.sclk)
        if(!vif.ss_n)begin
          vif.mosi <= req.header[(`ADDR_WIDTH - 1) - i];
        end /** if*/
        else 
          `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
    end /** foreach*/

    if(req.header[7]) begin
      foreach(req.wr_data[i]) begin
        @(negedge vif.sclk)
        if(!vif.ss_n)begin
          vif.mosi <= req.wr_data[(`ADDR_WIDTH - 1) - i];
        end /** if*/
        else 
          `uvm_fatal(get_full_name(),"SLAVE SELECT DE-ASSERTED IN BETWEEN");
      end /** forach*/
       
      fork
        begin 
          repeat(2*baudrate_divisor) @(edge vif.bclk);
          vif.mosi <= 1'bz;
       end /** begin*/
      join_none
    end /** if*/

    else begin
      foreach(req.wr_data[i]) begin
        @(negedge vif.sclk)
        vif.mosi <= 1'bz;
      end /** foreach*/
    end /** else*/
  endtask : lsb_first_drv_negedge