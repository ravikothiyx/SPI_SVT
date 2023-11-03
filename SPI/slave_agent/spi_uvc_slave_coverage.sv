////////////////////////////////////////////////``
// Company:       SCALEDGE
// File:          spi_uvc_slave_coverage.sv
// Version:       1.0
// Developer:     
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

/**Class Description:*/
`ifndef SPI_UVC_SLAVE_COVERAGE_SV
`define SPI_UVC_SLAVE_COVERAGE_SV
class spi_uvc_slave_coverage extends uvm_subscriber#(spi_uvc_transaction);
   `uvm_component_utils(spi_uvc_slave_coverage);
   
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

 /**Covergroup "spi_cvg"*/
   covergroup spi_cvg with function sample(spi_uvc_transaction trans_h);

   spi_uvc_b2b_mode_cp: coverpoint trans_h.header{
                                                     bins wr_rd_enb=(8'b00000000=>8'b10000000=>8'b00000000=>8'b10000000);
                                                     bins b2b_wr_enb={8'b10000000};
                                                     bins b2b_rd_enb={8'b00000000};
                                                    }

  spi_uvc_shift_reg_header_cp: coverpoint trans_h.header{  
                                                         bins header_8bit={[8'd0:8'd7]};
                                                         bins header_16bit={[16'd0:16'd15]};
                                                         bins header_32bit={[32'd0:32'd31]};
                                                        }
 
  spi_uvc_shift_reg_rd_data_cp: coverpoint trans_h.rd_data{
                                                           bins rd_data_8bit={[8'd0:8'd7]};
                                                           bins rd_data_16bit={[16'd0:16'd15]};
                                                           bins rd_data_32bit={[32'd0:32'd31]};
                                                          }

  endgroup

endclass
`endif /**: SPI_UVC_SLAVE_COVERAGE*/

   /**Standard UVM Methods:*/
   function spi_uvc_slave_coverage::new(string name = "spi_uvc_slave_coverage",uvm_component parent);
      super.new(name,parent);
      spi_cvg = new();
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
    spi_cvg.sample(t);
   endfunction : write

   /**extract_phase*/
   function void spi_uvc_slave_coverage::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase
