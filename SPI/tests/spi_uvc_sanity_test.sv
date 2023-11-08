//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_sanity_test.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SANITY_TEST_SV
`define SPI_UVC_SANITY_TEST_SV

class spi_uvc_sanity_test extends spi_uvc_base_test;

  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_sanity_test)

  /** Function new */
  extern function new(string name ="spi_uvc_sanity_test",uvm_component parent);
 
  /** Handle of virtual sequence */
  spi_uvc_wr_vseqs spi_vseqs_h;
 
  /** Run phase */
  extern task run_phase(uvm_phase phase);
endclass : spi_uvc_sanity_test
`endif /** SPI_UVC_SANITY_TEST_SV*/

  function spi_uvc_sanity_test::new(string name = "spi_uvc_sanity_test",uvm_component parent);
    super.new(name,parent);
    spi_vseqs_h = spi_uvc_wr_vseqs::type_id::create("vseqs_h");
  endfunction : new

  /** Run_phase*/
  task spi_uvc_sanity_test::run_phase(uvm_phase phase);
    phase.raise_objection(this);
    /** Starting virtual sequence on virtual sequencer*/
    spi_vseqs_h.start(spi_env_h.spi_vseqr_h);
    phase.drop_objection(this);
  endtask : run_phase
