//////////////////////////////////////////////// 
// File:          spi_uvc_slave_driver.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_SLAVE_DRIVER_SV
`define SPI_UVC_SLAVE_DRIVER_SV

class spi_uvc_slave_driver extends uvm_driver#(spi_uvc_transaction);
   
   /**UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_slave_driver);
   
   /** SPI interface instance */
   virtual spi_uvc_if vif;

   /** SPI reg configuration instance*/
   spi_uvc_reg_cfg reg_cfg_h;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_driver",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);
   
   /** Task to drive data MSB first and at posedge*/
   extern task msb_first_drv_posedge();

   /** Task to drive data MSB first and at negedge*/
   extern task msb_first_drv_negedge();

   /** Task to drive data LSB first and at posedge*/
   extern task lsb_first_drv_posedge();

   /** Task to drive data MSB first and at negedge*/
   extern task lsb_first_drv_negedge();

endclass : spi_uvc_slave_driver
`endif /**: SPI_UVC_SLAVE_DRIVER_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_driver::new(string name = "spi_uvc_slave_driver",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_slave_driver::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving register configuration*/
      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","reg_cfg_h",reg_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the register configuration");
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_slave_driver::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_uvc_slave_driver::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);

      /** Waiting For Initial Reset*/
      wait(!vif.rstn);
      wait(vif.rstn);

      forever begin
        /** waiting for the slave select*/
        @(negedge vif.ss_n)begin
         `uvm_info(get_type_name(),"Inside driver forever loop 1",UVM_HIGH);
         fork : init
            /** waiting for the inbetween reset*/
            begin
               wait(!vif.rstn);
            end

            /** Driving*/
            forever begin
               /** Checking for SPE spi enable bit to start driving*/
               `uvm_info(get_type_name(),"Inside driver forever loop 2",UVM_HIGH);
               if(reg_cfg_h.SPICR1[6]) begin
                  seq_item_port.get_next_item(req);
                  `uvm_info(get_type_name(),"After get_next_item call",UVM_HIGH);
                  /** Mode 0 (driving at posedge)*/
                  if(reg_cfg_h.SPICR1[3:2] == 2'b00)begin
                     `uvm_info(get_type_name(),"SLAVE DRIVER MODE 0",UVM_HIGH);
                     if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                        msb_first_drv_negedge();
                     end /** if*/
                     else begin
                        lsb_first_drv_negedge();
                     end /** else*/
                  end /** if*/
            
                  /** Mode 1 (driving at negedge)*/
                  else if(reg_cfg_h.SPICR1[3:2] == 2'b01)begin
                     `uvm_info(get_type_name(),"SLAVE DRIVER MODE 1",UVM_HIGH);
                     if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                        msb_first_drv_posedge();
                     end /** if*/
                     else begin
                        lsb_first_drv_posedge();
                     end /** else*/
                  end /** else if*/
            
                  /** Mode 2 (driving at negedge)*/
                  else if(reg_cfg_h.SPICR1[3:2] == 2'b10)begin
                     `uvm_info(get_type_name(),"SLAVE DRIVER MODE 2",UVM_HIGH);
                     if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                        msb_first_drv_posedge();
                     end /** if*/
                     else begin
                        lsb_first_drv_posedge();
                     end /** else*/
                  end /** else if*/
            
                  /** Mode 3 (driving at posedge)*/
                  else if(reg_cfg_h.SPICR1[3:2] == 2'b11)begin
                     `uvm_info(get_type_name(),"SLAVE DRIVER MODE 3",UVM_HIGH);
                     if(!reg_cfg_h.SPICR1[0]) begin /** Check for LSB/MSB first*/
                        msb_first_drv_negedge();
                     end /** if*/
                  
                     else begin
                        lsb_first_drv_negedge();
                     end /** else*/
                  end /** else if*/
                  seq_item_port.item_done();
                  //vif.miso <= 1'bz;
               end /** if*/
  
               else begin
                  vif.miso <= 1'bz;
               end /** else*/
            end /** forever*/
         join_any 
         
         /** Disabling driving(needed after inbtween reset)*/
         disable init;
        
         /** Waiting for reset to be deasserted*/
         wait(vif.rstn);
         `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
        end /** ss_n*/
      end /** forever*/
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase

   /** msb first driving on posedge*/
   task spi_uvc_slave_driver::msb_first_drv_posedge();
     /** Checking type of the transaction write or read*/
     if(!req.header[7]) begin
       /** Driving the read data to the miso bit by bit at ever edge of sclk*/
       foreach(req.rd_data[i]) begin
         @(posedge vif.sclk)
         vif.miso <= req.rd_data[i];
       end /** foreach*/
     end /** if*/

     else begin
       /** If it is write transaction then drive miso to high impedence*/
       foreach(req.rd_data[i]) begin
         @(posedge vif.sclk)
         vif.miso <= 1'bz;
       end /**foreach*/
     end /** else*/
   endtask : msb_first_drv_posedge

   /** msb first driving on negedge*/
   task spi_uvc_slave_driver::msb_first_drv_negedge();
     /** Checking type of the transaction write or read*/
     if(!req.header[7]) begin
       /** Driving the read data to the miso bit by bit at ever edge of sclk*/
       foreach(req.rd_data[i]) begin
         @(negedge vif.sclk)
         vif.miso <= req.rd_data[i];
       end /** foreach*/
     end /** if*/

     else begin
       /** If it is write transaction then drive miso to high impedence*/
       foreach(req.rd_data[i]) begin
         @(negedge vif.sclk)
         vif.miso <= 1'bz;
       end /** foreach*/
     end /** else*/
   endtask : msb_first_drv_negedge

   /** lsb first driving on posedge*/
   task spi_uvc_slave_driver::lsb_first_drv_posedge();
     /** Checking type of the transaction write or read*/
     if(!req.header[7]) begin
       /** Driving the read data to the miso bit by bit at ever edge of sclk*/
       foreach(req.rd_data[i]) begin
         @(posedge vif.sclk)
         vif.miso <= req.rd_data[(`ADDR_WIDTH - 1) - i];
       end /** foreach*/
     end /** if*/

     else begin
       /** If it is write transaction then drive miso to high impedence*/
       foreach(req.wr_data[i]) begin
         @(posedge vif.sclk)
         vif.miso <= 1'bz;
       end /** foreach*/
     end /** else*/
   endtask : lsb_first_drv_posedge

   /** lsb first driving on negedge*/
   task spi_uvc_slave_driver::lsb_first_drv_negedge();
     /** Checking type of the transaction write or read*/
     if(!req.header[7]) begin
       /** Driving the read data to the miso bit by bit at ever edge of sclk*/
       foreach(req.rd_data[i]) begin
         @(negedge vif.sclk)
         vif.miso <= req.rd_data[(`ADDR_WIDTH - 1) - i];
       end /** foreach*/
     end /** if*/

     else begin
       /** If it is write transaction then drive miso to high impedence*/
       foreach(req.rd_data[i]) begin
         @(negedge vif.sclk)
         vif.miso <= 1'bz;
       end /** foreach*/
     end /** else*/
   endtask : lsb_first_drv_negedge



