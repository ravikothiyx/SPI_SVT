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
   `include "spi_uvc_env_config.sv"
   `include "spi_uvc_agent_config.sv"
   `include "spi_uvc_reg_config.sv"
   
   /** Transaction files*/ 
   `include "spi_uvc_trans.sv"

   /** Sequencer file*/
   `include "spi_uvc_sequencer.sv"

   /** Agent files*/
   `include "spi_uvc_driver.sv"
   `include "spi_uvc_monitor.sv"
   `include "spi_uvc_coverage.sv"
   `include "spi_uvc_agent.sv"

   /** Scoreboard*/
   `include "spi_uvc_scoreboard.sv"

   /** Virtual sequencer*/
   `include "spi_uvc_virtual_sequencer.sv"

   /** Environment and Testcases seuqences*/
   `include "spi_uvc_env.sv"
   
   /** Virtual sequence*/
   `include "spi_uvc_virtual_sequence.sv"
   
   /** Testcases*/  
   `include "spi_uvc_base_test.sv"
endpackage : spi_uvc_pkg
`endif /**SPI_UVC_PKG*/
