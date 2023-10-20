//////////////////////////////////////////////// 
// File:          spi_uvc_sanity_test.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SANITY_TEST_SV
`define SPI_UVC_SANITY_TEST_SV

class spi_uvc_sanity_test extends spi_uvc_base_test;

  /**  UVM Factory Registration Macro*/
 `uvm_component_utils(spi_uvc_sanity_test)

 /** function new */
  extern function new(string name ="spi_uvc_sanity_test",uvm_component parent);
 /** handle of virtual sequence */
 spi_uvc_wr_vseqs vseqs_h;
 
 /**run phase */
 extern task run_phase(uvm_phase phase);
  
endclass

`endif 
function spi_uvc_sanity_test::new(string name = "spi_uvc_sanity_test",uvm_component parent);
  super.new(name,parent);
 vseqs_h = spi_uvc_wr_vseqs::type_id::create("vseqs_h");
endfunction

task spi_uvc_sanity_test::run_phase(uvm_phase phase);
 phase.raise_objection(this);
 vseqs_h.start(env_h.vseqr_h);
 phase.drop_objection(this);
endtask
