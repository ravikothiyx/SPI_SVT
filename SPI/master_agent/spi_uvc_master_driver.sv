//////////////////////////////////////////////// 
// File:          spi_uvc_master_driver.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_DRIVER_SV
`define SPI_UVC_MASTER_DRIVER_SV

`include "../src/spi_uvc_transaction.sv"

class spi_uvc_master_driver extends uvm_driver #(spi_uvc_transaction);
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_master_driver);

   /** Instance of Interface*/
   virtual spi_uvc_if drv_vif;

   /** Instance of Register config*/
   spi_uvc_reg_cfg reg_cfg_h;

   int baudrate_divisor;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_master_driver",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

   extern task msb_first_drv_posedge();

   extern task msb_first_drv_negedge();

   extern task lsb_first_drv_posedge();

   extern task lsb_first_drv_negedge();

endclass : spi_uvc_master_driver
`endif //: SPI_UVC_MASTER_DRIVER_SV

   /** Standard UVM Methods*/
   function spi_uvc_master_driver::new(string name = "spi_uvc_master_driver",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_master_driver::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_master_driver::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_master_driver::run_phase(uvm_phase phase);
      super.run_phase(phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      //`uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);

      /** Waiting For Initial Reset*/
      wait(!drv_vif.rstn);
      wait(drv_vif.rstn);

      forever begin
        fork : init
          begin
            wait(!drv_vif.rstn);
          end
          forever begin
            if(reg_cfg_h.SPICR1[6]) begin
              @(posedge drv_vif.clk)
              drv_vif.ss_n <= 0; /** Enable The Slave Select pin*/
              seq_item_port.get_next_item(req);

              /** Clock Generation*/
              @(posedge drv_vif.clk)
              baudrate_divisor = (reg_cfg_h.SPIBR[6:4] + 1)*('b1<<(reg_cfg_h.SPIBR[2:0]));
              fork
                while(!drv_vif.ss_n) begin
                  if(reg_cfg_h.SPICR1[3]) begin
                    drv_vif.sclk <= 1;
                    repeat(baudrate_divisor) @(edge drv_vif.clk);
                    drv_vif.sclk <= 0;
                    repeat(baudrate_divisor) @(edge drv_vif.clk);
                  end
                  else begin
                    drv_vif.sclk <= 0;
                    repeat(baudrate_divisor) @(edge drv_vif.clk);
                    drv_vif.sclk <= 1;
                    repeat(baudrate_divisor) @(edge drv_vif.clk);
                  end
                end
              join_none
              if(reg_cfg_h.SPICR1[2]) begin /** Checking for wr/rd at odd edges*/
                if(reg_cfg_h.SPICR1[3]) begin /** Checking For negedge/posedge first*/
                  if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                    msb_first_drv_negedge();
                  end
                  else begin
                    lsb_first_drv_negedge();
                  end
                end
                else begin
                  if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                    msb_first_drv_posedge();
                  end
                  else begin
                    lsb_first_drv_posedge();
                  end
                end
              end
              else begin
                if(reg_cfg_h.SPICR1[3]) begin /** Checking For negedge/posedge first*/
                  if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                    msb_first_drv_posedge();
                  end
                  else begin
                    lsb_first_drv_posedge();
                  end
                end
                else begin
                  if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                    msb_first_drv_negedge();
                  end
                  else begin
                    lsb_first_drv_negedge();
                  end
                end
              end
              @(posedge drv_vif.clk) drv_vif.sclk <= reg_cfg_h.SPICR1[3];
              @(posedge drv_vif.clk) drv_vif.ss_n <= 1'b1;
              seq_item_port.item_done();
            end
            else begin
              drv_vif.sclk <= reg_cfg_h.SPICR1[3];
              drv_vif.ss_n <= 1'b1;
              drv_vif.mosi <= 1'bz;
            end
          end
        join_any
        disable init;
        wait(drv_vif.rstn);
        `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
      end
   endtask : run_phase

   /** msb first driving on posedge*/
   task spi_uvc_master_driver::msb_first_drv_posedge();
     foreach(req.header[i]) begin
       @(posedge drv_vif.sclk)
       drv_vif.mosi <= req.header[i];
     end
     if(req.header[7]) begin
       foreach(req.wr_data[i]) begin
         @(posedge drv_vif.sclk)
         drv_vif.mosi <= req.wr_data[i];
       end
     end
     else begin
       foreach(req.wr_data[i]) begin
         @(posedge drv_vif.sclk)
         drv_vif.mosi <= 1'bz;
       end
     end
   endtask : msb_first_drv_posedge

   /** msb first driving on negedge*/
   task spi_uvc_master_driver::msb_first_drv_negedge();
     foreach(req.header[i]) begin
       @(negedge drv_vif.sclk)
       drv_vif.mosi <= req.header[i];
     end
     if(req.header[7]) begin
       foreach(req.wr_data[i]) begin
         @(negedge drv_vif.sclk)
         drv_vif.mosi <= req.wr_data[i];
       end
     end
     else begin
       foreach(req.wr_data[i]) begin
         @(negedge drv_vif.sclk)
         drv_vif.mosi <= 1'bz;
       end
     end
   endtask : msb_first_drv_negedge

   /** lsb first driving on posedge*/
   task spi_uvc_master_driver::lsb_first_drv_posedge();
     foreach(req.header[i]) begin
       @(posedge drv_vif.sclk)
       drv_vif.mosi <= req.header[(`ADDR_WIDTH - 1) - i];
     end
     if(req.header[7]) begin
       foreach(req.wr_data[i]) begin
         @(posedge drv_vif.sclk)
         drv_vif.mosi <= req.wr_data[(`ADDR_WIDTH - 1) - i];
       end
     end
     else begin
       foreach(req.wr_data[i]) begin
         @(posedge drv_vif.sclk)
         drv_vif.mosi <= 1'bz;
       end
     end
   endtask : lsb_first_drv_posedge

   /** lsb first driving on negedge*/
   task spi_uvc_master_driver::lsb_first_drv_negedge();
     foreach(req.header[i]) begin
       @(negedge drv_vif.sclk)
       drv_vif.mosi <= req.header[(`ADDR_WIDTH - 1) - i];
     end
     if(req.header[7]) begin
       foreach(req.wr_data[i]) begin
         @(negedge drv_vif.sclk)
         drv_vif.mosi <= req.wr_data[(`ADDR_WIDTH - 1) - i];
       end
     end
     else begin
       foreach(req.wr_data[i]) begin
         @(negedge drv_vif.sclk)
         drv_vif.mosi <= 1'bz;
       end
     end
   endtask : lsb_first_drv_negedge
