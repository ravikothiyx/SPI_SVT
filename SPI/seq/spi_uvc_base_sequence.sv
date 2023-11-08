///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_base_sequence.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI 
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_BASE_SEQUENCE_SV
`define SPI_UVC_BASE_SEQUENCE_SV
class spi_uvc_base_sequence extends uvm_sequence;
  /** UVM Factory Registration Macro*/
  `uvm_object_utils(spi_uvc_base_sequence);

  /** Standard UVM Methods*/  
  function new(string name = "spi_uvc_base_sequence");
    super.new(name);
  endfunction : new

  /** Task body*/
  task body();
    `uvm_info(get_type_name(),"START OF THE BASE SEQUENCE BODY",UVM_HIGH);
    `uvm_info(get_type_name(),"END OF THE BASE SEQUENCE BODY",UVM_HIGH);
  endtask : body 
endclass : spi_uvc_base_sequence
`endif /** SPI_UVC_BASE_SEQUENCE_SV*/
