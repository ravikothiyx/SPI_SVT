////////////////////////////////////////////////
// File:          spi_uvc_master_coverage.sv
// Version:       v1
// Developer:     
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////

/**Covergroup "spi_cvg"*/
   covergroup spi_cvg with function sample(spi_uvc_transaction trans_h);
   
   /**coverpoint for back to back mode*/ 
   spi_uvc_b2b_mode_cp: coverpoint trans_h.header{
                                                   /**wildcard bins for write-read enable check*/
                                                   wildcard bins b2b_wr_rd_enb=(8'b1???????=>8'b0???????=>8'b1???????=>8'b0???????);
                                                   /**wildcard bins for 8time write enable check*/
                                                   wildcard bins wr_enb=(8'b1???????[*10]);
                                                   /**wildcard bins for 8time read enable check*/
                                                   wildcard bins rd_enb=(8'b0???????[*10]);
                                                  }

   /**coverpoint for header(header) */
   spi_uvc_shift_reg_header_cp: coverpoint trans_h.header{  
                                                           /**bins for "low range" of header*/
                                                           bins lowest_header={0};

                                                           /**bins for "low range" of header*/
                                                           bins highest_header={256};
                                                           
                                                           /**bins for "mid range" of header*/
                                                           bins mid_range_header={[1:255]};
                                                          }

   /**coverpoint for write data(wr_data) */
   spi_uvc_shift_reg_wr_data_cp: coverpoint trans_h.wr_data{  
                                                           /**bins for "low range" of write data*/
                                                           bins wr_data_low_range={[8'd1:8'd254]};     

                                                           /**bins for "lowest value" of write data*/
                                                           bins wr_data_lowest={8'd0};
                                                           
                                                           /**bins for "mid range" of write data*/
                                                           bins wr_data_mid_range={[16'd257:16'd65534]};
                                                           
                                                           /**bins for "high range" of write data*/
                                                           bins wr_data_high_range={[32'd65536:32'hfffffffe]};
                                                           
                                                           /**bins for "highest value" of write data */
                                                           bins wr_data_highest={32'hffffffff};
                                                          }
   /**coverpoint for read data(rd_data) */
   spi_uvc_shift_reg_rd_data_cp: coverpoint trans_h.rd_data{
                                                           /**bins for "low range" of read data*/
                                                           bins rd_data_low_range={[8'd1:8'd254]};
                                                           
                                                           /**bins for "lowest value" of read data*/
                                                           bins rd_data_lowest={8'd0};
                                                           
                                                           /**bins for "mid range" of read data*/
                                                           bins rd_data_mid_range={[16'd257:16'd65534]};
                                                           
                                                           /**bins for "high range" of read data*/
                                                           bins rd_data_high_range={[32'd65536:32'hfffffffe]};
                                                           
                                                           /**bins for "highest value" of read data */
                                                           bins rd_data_highest={32'hffffffff};
                                                          }
   endgroup:spi_cvg

`ifndef SPI_UVC_MASTER_COVERAGE_SV
`define SPI_UVC_MASTER_COVERAGE_SV
class spi_uvc_master_coverage extends uvm_subscriber#(spi_uvc_transaction);

   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_master_coverage);
   

   spi_cvg cvg;
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
   
endclass
`endif //: SPI_UVC_MASTER_COVERAGE

   /** Standard UVM Methods*/
   function spi_uvc_master_coverage::new(string name = "spi_uvc_master_coverage",uvm_component parent);
      super.new(name,parent);
      cvg = new();
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
      `uvm_info(get_type_name(),$sformatf("t.header = %0b",t.header),UVM_NONE);
      cvg.sample(t);
   endfunction : write

   /** Extract_phase*/
   function void spi_uvc_master_coverage::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase
