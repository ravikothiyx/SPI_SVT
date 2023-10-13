///////////////////////////////////////////////
// File:          spi_uvc_pkg.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:   SPI package file 
/////////////////////////////////////////////////


/** Package Discription:*/


`ifndef SPI_UVC_PKG_SV
`define SPI_UVC_PKG_SV

`include "spi_uvc_inf.sv"
package spi_uvc_pkg;
   
   /** Header files*/
   import uvm_pkg::*;
   `include "uvm_macros.svh"
   
   /** Agent configuration file*/
   `include "spi_uvc_master_config.sv"
   `include "spi_uvc_slave_config.sv"
   `include "spi_uvc_env_config.sv"
   `include "spi_uvc_reg_config.sv"
   
   /** Master transaction files*/ 
   `include "spi_uvc_trans.sv"

   /** Master and  slave sequencer files*/
   `include "spi_uvc_master_sequencer.sv"
   `include "spi_uvc_slave_sequencer.sv"

   /** Master files*/
   `include "spi_uvc_master_driver.sv"
   `include "spi_uvc_master_monitor.sv"
   `include "spi_uvc_master_coverage.sv"
   `include "spi_uvc_master_agent.sv"

   /** Slave files*/
   `include "spi_uvc_slave_driver.sv"
   `include "spi_uvc_slave_monitor.sv"
   `include "spi_uvc_slave_coverage.sv"
   `include "spi_uvc_slave_agent.sv"

   /** Virtual sequencer*/
   `include "spi_uvc_virtual_sequencer.sv"

   /** Environment and Testcases seuqences*/
   `include "spi_uvc_env.sv"
   
   /** Virtual sequence*/
   `include "spi_uvc_virtual_sequence.sv"
   
   /** Checker*/ 
   `include "spi_uvc_checker.sv"

   /** Testcases*/  
   `include "spi_uvc_base_test.sv"
endpackage : spi_uvc_pkg
`endif /**SPI_UVC_PKG*/
