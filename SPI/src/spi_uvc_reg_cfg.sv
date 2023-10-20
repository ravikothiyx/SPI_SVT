//////////////////////////////////////////////// 
// File:          spi_uvc_reg_cfg.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the configuration for SPI control registers and Status registers
/////////////////////////////////////////////////


`ifndef SPI_UVC_REG_CONFIG_SV
`define SPI_UVC_REG_CONFIG_SV

class spi_uvc_reg_cfg extends uvm_object;
   
  /** UVM Factory Registration Macro*/
  `uvm_object_utils(spi_uvc_reg_cfg);

  /** Register configurations*/
  
  /** SPI CONTROL REGISTER 1*/
  bit [7:0] SPICR1 = 8'b0100_0000;  
 

  /** SPI CONTROL REGISTER 2*/
  bit [7:0] SPICR2 = 8'b0000_0000;  
  
  /** SPI BAUD RATE REGISTER 1*/
  bit [7:0] SPIBR = 8'b0111_0111;  

  /** SPI STATUS REGISTER 1*/
  bit [7:0] SPISR = 8'b0010_0000;  
  
  /** Standarad UVM Methods*/
  extern function new(string name = "spi_uvc_reg_cfg");

endclass
`endif /** SPI_UVC_REG_CONFIG_SV*/

  /** Defination of extern function*/

 function spi_uvc_reg_cfg::new(string name ="spi_uvc_reg_cfg");
  super.new(name);
 endfunction : new
 
