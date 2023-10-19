////////////////////////////////////////////////
// File:          spi_uvc_master_coverage.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////

`ifndef SPI_UVC_MASTER_COVERAGE_SV
`define SPI_UVC_MASTER_COVERAGE_SV
class spi_uvc_master_coverage extends uvm_subscriber#(spi_uvc_transaction);

   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_master_coverage);
   
   /**Register configuration handle*/
   spi_uvc_reg_cfg reg_cfg_h;

   /**Transaction class handle*/
   spi_uvc_transaction trans_h;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_master_coverage",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Write method*/
   extern function void write(spi_uvc_transaction t);

   /** Extract_phase*/
   extern function void extract_phase(uvm_phase phase);

   /**Covergroup "spi_cvg"*/
   covergroup spi_cvg with function sample(spi_uvc_transaction trans_h,spi_uvc_reg_cfg reg_cfg_h);
   
   /**Coverpoint for master mode,slave mode & back to back transaction mode*/
   /*spi_uvc_mode_cp: coverpoint reg_cfg_h.SPICR1{
                                                    bins MSTR=00010000;
                                                    //bins MSTR=0;
                                                   }*/
   spi_uvc_b2b_mode_cp: coverpoint trans_h.header{
                                                     bins wr_rd_enb=(8'b00000000=>8'b10000000=>8'b00000000=>8'b10000000);
                                                     bins b2b_wr_enb={8'b10000000};
                                                     bins b2b_rd_enb={8'b00000000};
                                                    }

  /**Coverpoint for baud rate calculations(All range, Minimum & Maximum)*/
  /*spi_uvc_baud_rate_cp: coverpoint reg_cfg_h.SPIBR{
                                                    //bins baud_rate=[0:'h77];
                                                    bins min_baud_rate=0;
                                                    bins max_baud_rate='h77;
                                                   }
*/
  /**Coverpoint for different address & data width shift registers*/
/*  spi_uvc_shift_reg_addr_8bit_cp: coverpoint trans_h.HEADER[1:7]{
                                                                 //bins header=[1:7];
                                                                }

  spi_uvc_shift_reg_addr_16bit_cp: coverpoint trans_h.HEADER[1:15]{
                                                                   //bins header=[1:15];
                                                                  }
 
  spi_uvc_shift_reg_addr_32bit_cp: coverpoint trans_h.HEADER[1:31]{
                                                                   //bins header=[1:31];
                                                                  }
  */
  spi_uvc_shift_reg_header_cp: coverpoint trans_h.header{  
                                                           bins header_8bit={[8'd0:8'd7]};
                                                           bins header_16bit={[16'd0:16'd15]};
                                                           bins header_32bit={[32'd0:32'd31]};
                                                          }

  spi_uvc_shift_reg_wr_data_cp: coverpoint trans_h.wr_data{  
                                                           bins wr_data_8bit={[8'd0:8'd7]};
                                                           bins wr_data_16bit={[16'd0:16'd15]};
                                                           bins wr_data_32bit={[32'd0:32'd31]};
                                                          }
 
  /**Coverpoint for SPI Phases*/
  /*spi_uvc_cphase_cp: coverpoint reg_config.SPICR1[2]{
                                                     bins cphase_low=0;
                                                     bins cphase_high=1;
                                                      }*/

  /**Coverpoint for SPI Polarity*/
  /*spi_uvc_cpol_cp: coverpoint reg_config.SPICR1[3]{
                                                     bins cpol_low=0;
                                                     bins cpol_high=1;
                                                    }
  */
  /**Coverpoint based on Endians*/
  /*spi_uvc_endians_cp: coverpoint reg_config.SPICR1[0]{
                                                     bins lsb_first=0;
                                                     bins msb_first=1;
                                                    }
  */
  /**Cross coverage*/

  /**Cross between SPI Modes and Shift register widths*/ 
  //spi_uvc_mode_cp_X_spi_uvc_shift_reg_cp: cross spi_uvc_mode_cp,spi_uvc_shift_reg_addr_8bit_cp;

  /**Cross between SPI Polarity and Phase*/ 
  //spi_sv_cpol_cp_X_spi_uvc_cphase_cp: cross spi_uvc_cpol_cp,spi_uvc_cphase_cp;
  
  /**Cross between SPI diff. endians and Shift register widths*/ 
  //spi_uvc_endians_cp_X_spi_uvc_shift_reg_cp: cross spi_uvc_endians_cp, spi_uvc_shift_reg_addr_8bit_cp;
  endgroup
endclass
`endif //: SPI_UVC_MASTER_COVERAGE

   /** Standard UVM Methods*/
   function spi_uvc_master_coverage::new(string name = "spi_uvc_master_coverage",uvm_component parent);
      super.new(name,parent);
      spi_cvg = new();
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_master_coverage::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(this,"","reg_cfg_h",reg_cfg_h))
      `uvm_fatal(get_full_name(),"Not able to get Register configuration class");
      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Write method*/
   function void spi_uvc_master_coverage::write(spi_uvc_transaction t);
      spi_cvg.sample(trans_h,reg_cfg_h);
   endfunction : write

   /** Extract_phase*/
   function void spi_uvc_master_coverage::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase
