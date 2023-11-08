////////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_virtual_sequencer.sv
// Version:       1.0
// Developer:     
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_VIRTUAL_SEQUENCER
`define SPI_UVC_VIRTUAL_SEQUENCER
class spi_uvc_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_virtual_sequencer);

  /** Instance of the sub_sequencers*/
  spi_uvc_master_sequencer spi_mseqr_h;
  spi_uvc_slave_sequencer  spi_sseqr_h;

  /** Standard UVM Methods*/ 
  extern function new(string name = "spi_uvc_virtual_sequencer",uvm_component parent);
endclass : spi_uvc_virtual_sequencer
`endif /** SPI_UVC_VIRTUAL_SEQUENCER*/

  /** Standard UVM Methods*/ 
  function spi_uvc_virtual_sequencer::new(string name = "spi_uvc_virtual_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction : new
