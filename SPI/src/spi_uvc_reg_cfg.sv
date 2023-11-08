//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_reg_cfg.sv
// Version:       1.0
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
  bit [7:0] SPICR1;  
 

  /** SPI CONTROL REGISTER 2*/
  bit [7:0] SPICR2;  
  
  /** SPI BAUD RATE REGISTER 1*/
  bit [7:0] SPIBR;  

  /** SPI STATUS REGISTER 1*/
  bit [7:0] SPISR;  
  
  /** Standarad UVM Methods*/
  extern function new(string name = "spi_uvc_reg_cfg");

endclass : spi_uvc_reg_cfg
`endif /** SPI_UVC_REG_CONFIG_SV*/

 /** Defination of extern function*/
 function spi_uvc_reg_cfg::new(string name ="spi_uvc_reg_cfg");
   super.new(name);
 endfunction : new
 
