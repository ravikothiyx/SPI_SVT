//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_b2b_rd_test.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_B2B_RD_TEST_SV
`define SPI_UVC_B2B_RD_TEST_SV

class spi_uvc_b2b_rd_test extends spi_uvc_base_test;
 
  /**  UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_b2b_rd_test)
 
  /** Function new */
  extern function new(string name ="spi_uvc_b2b_rd_test",uvm_component parent);
  
  /** Handle of virtual sequence*/
  spi_uvc_b2b_rd_vseqs spi_vseqs_h;
 
  /** Run phase */
  extern task run_phase(uvm_phase phase);
endclass : spi_uvc_b2b_rd_test
`endif /* SPI_UVC_B2B_RD_TEST_SV*/
  
  function spi_uvc_b2b_rd_test::new(string name = "spi_uvc_b2b_rd_test",uvm_component parent);
    super.new(name,parent);
    spi_vseqs_h = spi_uvc_b2b_rd_vseqs::type_id::create("spi_vseqs_h");
  endfunction : new

 task spi_uvc_b2b_rd_test::run_phase(uvm_phase phase);
   phase.raise_objection(this);
   /** Starting virtual sequence on virtual sequencer*/
   spi_vseqs_h.start(spi_env_h.spi_vseqr_h);
   phase.drop_objection(this);
 endtask : run_phase
