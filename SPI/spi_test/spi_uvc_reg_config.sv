//////////////////////////////////////////////// 
// File:          spi_uvc_reg_config.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the configuration for SPI control registers and Status registers
/////////////////////////////////////////////////


`ifndef SPI_UVC_REG_CONFIG_SV
`define SPI_UVC_REG_CONFIG_SV

class spi_uvc_reg_config extends uvm_object;
   
  /** UVM Factory Registration Macro*/
  `uvm_object_utils(spi_uvc_reg_config);

  /** Register configurations*/
  
  /** SPI CONTROL REGISTER 1*/
  bit [7:0] SPICR1;  
 

  /** SPI CONTROL REGISTER 2*/
  bit [7:0] SPICR2;  
  
  /** SPI BAUD RATE REGISTER 1*/
  bit [7:0] SPIBR;  

  /** SPI STATUS REGISTER 1*/
  bit [7:0] SPISR;  
  
  /** Standarad UVM Methods*/
  extern function new(string name = "spi_uvc_reg_config");

endclass
`endif /** SPI_UVC_REG_CONFIG_SV*/

  /** Defination of extern function*/

 function spi_uvc_reg_config::new(string name ="spi_uvc_reg_config");
  super.new(name);
 endfunction : new
 
