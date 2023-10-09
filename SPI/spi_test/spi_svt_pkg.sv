///////////////////////////////////////////////
// File:          spi_svt_pkg.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:   SPI package file 
/////////////////////////////////////////////////


/** Package Discription:*/


`ifndef SPI_PKG_SV
`define SPI_PKG_SV

`include "spi_svt_inf.sv"
package spi_svt_pkg;
   
   /**Header files*/
   import uvm_pkg::*;
   `include "uvm_macros.svh"
   
   /**Agent configuration file*/
   `include "spi_svt_master_config.sv"
   `include "spi_svt_slave_config.sv"

   /**Master transaction files*/ 
   `include "spi_svt_trans.sv"

   /**Master and  slave sequencer files*/
   `include "spi_svt_master_sequencer.sv"
   `include "spi_svt_slave_sequencer.sv"

   /**Master files*/
   `include "spi_svt_master_driver.sv"
   `include "spi_svt_master_monitor.sv"
   `include "spi_svt_master_coverage.sv"
   `include "spi_svt_master_agent.sv"
   `include "spi_svt_master_uvc.sv"

   /**Slave files*/
   `include "spi_svt_slave_driver.sv"
   `include "spi_svt_slave_monitor.sv"
   `include "spi_svt_slave_coverage.sv"
   `include "spi_svt_slave_agent.sv"
   `include "spi_svt_slave_uvc.sv"

   /**Scoreboard*/
   `include "spi_svt_scoreboard.sv"

<<<<<<< HEAD
   /**Virtual sequencer*/
   `include "spi_svt_virtual_sequencer.sv"

   /**Environment and Testcases seuqences*/
   `include "spi_svt_env_config.sv"
   `include "spi_svt_env.sv"
   
   /**Virtual sequence*/
   `include "spi_svt_virtual_sequence.sv"
   
   /**Testcases*/  
=======
   //Virtual sequencer
   //

   `include "spi_svt_virtual_sequencer.sv"

   //Environment and Testcases seuqences
   `include "spi_svt_env_config.sv"
   `include "spi_svt_env.sv"
   
   //Virtual sequence
   //
   `include "spi_svt_virtual_sequence.sv"
   
   //Testcases   
>>>>>>> ca595c3c8e7b85092f7ac4e5a5dea8a1b54e242b
   `include "spi_svt_base_test.sv"
endpackage : spi_svt_pkg
`endif /**spi_svt_PKG*/
