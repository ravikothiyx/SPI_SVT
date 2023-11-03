//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_checker.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////


`ifndef SPI_UVC_PACKAGE_SV
`define SPI_UVC_PACKAGE_SV

class spi_uvc_checker extends uvm_component;
   
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_checker);

  /** Standarad UVM Methods*/
  extern function new(string name = "spi_uvc_checker",uvm_component parent);

endclass
`endif /** SPI_UVC_PACKAGE_SV*/

  /** Defination of extern function*/

 function spi_uvc_checker::new(string name ="spi_uvc_checker",uvm_component parent);
  super.new(name,parent);
 endfunction : new
 
