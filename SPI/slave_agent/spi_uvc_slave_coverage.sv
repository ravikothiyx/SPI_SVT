////////////////////////////////////////////////
// File:          spi_uvc_slave_coverage.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

 /**Covergroup "spi_cvg"*/
   covergroup spi_slave_cvg with function sample(spi_uvc_transaction trans_h);

   /**coverpoint for read data(rd_data) */
   spi_uvc_shift_reg_rd_data_cp: coverpoint trans_h.rd_data iff(trans_h.header[7]==0){
                                                           option.comment ="Coverage bins for all possible values/data values of read data";
                                                           /**bins for "low range" of read data*/
                                                           bins rd_data_low_range={[8'h1:8'hFE]};
                                                           
                                                           /**bins for "lowest value" of read data*/
                                                           bins rd_data_lowest={8'h0};
                                                           
                                                           /**bins for "mid range" of read data*/
                                                           bins rd_data_mid_range={[16'hFF:16'hFFFE]};
                                                           
                                                           /**bins for "high range" of read data*/
                                                           bins rd_data_high_range={[32'hFFFF:32'h100000000]};
                                                           
                                                           /**bins for "highest value" of read data */
                                                           bins rd_data_highest={32'h100000000};
                                                           }
   
   /**Coverpoints for MODES : CPOL = 0,CPHASE = 0;
                              CPOL = 0,CPHASE = 1;
                              CPOL = 1,CPHASE = 0;
                              CPOL = 1,CPHASE = 1;*/
   /**CPOL Indicates Polarity and CPHASE Indicates Phase.*/
   
   spi_uvc_mode_cp: coverpoint trans_h.mode_h{
                                                 option.comment ="Coverage for All the four modes : 
                                                 CPOL = 0,CPHASE = 0;
                                                 CPOL = 0,CPHASE = 1;
                                                 CPOL = 1,CPHASE = 0;
                                                 CPOL = 1,CPHASE = 1";
                                                 bins mode_00 = {MODE_00};
                                                 bins mode_01 = {MODE_01};
                                                 bins mode_10 = {MODE_10};
                                                 bins mode_11 = {MODE_11};
                                                 }

   /**Coverpoints for LSBFE bit(Bit for LSB and MSB)coverage*/
   spi_uvc_mstr_mode_cp: coverpoint trans_h.mstr_mode_h{
                                                   option.comment ="Coverage for Master mode & Slave mode";
                                                   bins master_mode = {MASTER_MODE};
                                                   bins slave_mode = {SLAVE_MODE};
                                                   }
   /**Coverpoints for LSBFE bit(Bit for LSB and MSB)coverage*/
   spi_uvc_lsb_msb_cp: coverpoint trans_h.lsb_msb_h{
                                                   option.comment ="Coverage for LSB & MSB";
                                                   bins msb = {MSB_FIRST};
                                                   bins lsb = {LSB_FIRST};
                                                   }

   /**Coverpoints for baudrate coverage*/
   //spi_uvc_baudrate_cp: coverpoint trans_h.SPIBR_h{
     //                                            option.comment ="Coverage for baudrate : Highest baudrate, Lowest baudrate, Baudrate in range";
       //                                          bins baudrate_highest = {'h77};
         //                                        bins baudrate_lowest  = {'h0};
           //                                      bins baudrate_range   = {['h1:'h76]};
             //                                  }
   /**Cross coverages*/
   /**Cross coverage between cpol & cphase*/
   spi_uvc_mode_lsb_msb_cp: cross spi_uvc_mode_cp, spi_uvc_lsb_msb_cp;

   /**Cross coverage between mstr mode(Master & Slave mode) & the coverage of spi_uvc_cpol_cphase_cp */
   //spi_uvc_mstr_cpol_cphase_cp: cross spi_uvc_mstr_cp, spi_uvc_cpol_cphase_cp;

   endgroup:spi_slave_cvg
   
   /**Covergroup "spi_slave_toggle_cvg"*/
   covergroup spi_slave_toggle_cvg with function sample(bit data_bit);
   /**wr_data & rd_data*/
   TOGGLE:coverpoint data_bit{
                             bins a1 =(1 => 0);
                             bins a2 =(0 => 1);
                             }


  endgroup:spi_slave_toggle_cvg
/**Class Description:*/
`ifndef SPI_UVC_SLAVE_COVERAGE_SV
`define SPI_UVC_SLAVE_COVERAGE_SV
class spi_uvc_slave_coverage extends uvm_subscriber#(spi_uvc_transaction);
   `uvm_component_utils(spi_uvc_slave_coverage);
   
   /**Handles for all the different covergroups*/
   spi_slave_cvg cvg;
   spi_slave_toggle_cvg toggle_cvg;

   /**Register configuration handle*/
   spi_uvc_reg_cfg reg_cfg_h;

   /**Transaction class handle*/
   spi_uvc_transaction trans_h;
   
   /**Methods*/

   /**Standard UVM Methods:*/
   extern function new(string name = "spi_uvc_slave_coverage",uvm_component parent);

   /**build_phase*/
   extern function void build_phase(uvm_phase phase);
   
   /**write method*/
   extern function void write(spi_uvc_transaction t);

   /**extract_phase*/
   extern function void extract_phase(uvm_phase phase);
endclass
`endif /**: SPI_UVC_SLAVE_COVERAGE*/

   /**Standard UVM Methods:*/
   function spi_uvc_slave_coverage::new(string name = "spi_uvc_slave_coverage",uvm_component parent);
      super.new(name,parent);
      cvg = new();
      toggle_cvg = new();
   endfunction : new

   /**build_phase*/
   function void spi_uvc_slave_coverage::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","reg_cfg_h",reg_cfg_h))
        `uvm_fatal(get_full_name(),"Not able to get Register configuration class");
      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /**write method*/
   function void spi_uvc_slave_coverage::write(spi_uvc_transaction t);
   trans_h = t;

      if(trans_h.header[7]==1)begin
       foreach(trans_h.wr_data[i])begin
        toggle_cvg.sample(trans_h.wr_data[i]);
       end
      end
      if(trans_h.header[7]==0)begin
       foreach(trans_h.rd_data[i])begin
        toggle_cvg.sample(trans_h.rd_data[i]);
       end
      end


    cvg.sample(t);
   endfunction : write

   /**extract_phase*/
   function void spi_uvc_slave_coverage::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase
