///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_pkg.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:   SPI master package file 
/////////////////////////////////////////////////


/** Package Discription:*/


`ifndef SPI_UVC_PKG_SV
`define SPI_UVC_PKG_SV


`include "spi_uvc_if.sv"
package spi_uvc_pkg;
   
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   /** SPI defines files*/
   `include "spi_uvc_defines.sv"

   /** SRC transaction file*/
   `include "spi_uvc_transaction.sv" 
   
   /** Agent configuration file*/
   `include "spi_uvc_master_cfg.sv"
   `include "spi_uvc_slave_cfg.sv"  
   `include "spi_uvc_system_cfg.sv"  
   `include "spi_uvc_reg_cfg.sv"  

   /** Master files*/
   `include "spi_uvc_master_sequencer.sv"
   `include "spi_uvc_master_driver.sv"
   `include "spi_uvc_master_monitor.sv"
   `include "spi_uvc_master_coverage.sv"
   `include "spi_uvc_master_agent.sv"
   
   /** Slave files*/
   `include "spi_uvc_slave_sequencer.sv"
   `include "spi_uvc_slave_driver.sv"
   `include "spi_uvc_slave_monitor.sv"
   `include "spi_uvc_slave_coverage.sv"
   `include "spi_uvc_slave_agent.sv"

   `include "spi_uvc_sb.sv"
   /** Checker*/
   `include "spi_uvc_checker.sv"

   /** Bus Monitor*/
   `include "spi_uvc_bus_monitor.sv"

   /** Virtual sequencer*/
   `include "spi_uvc_virtual_sequencer.sv"

   /** Environment files*/
   `include "spi_uvc_env.sv"

   /** Sequence lib file*/
   `include "spi_uvc_seq_lib.sv"

   /** Base sequence file*/
   `include "spi_uvc_base_sequence.sv"
   
   `include "spi_uvc_mstr_base_seqs.sv"

   `include "spi_uvc_slv_base_seqs.sv"

   `include "spi_uvc_slv_seqs.sv"

   `include "spi_uvc_rd_seqs.sv"
  
   `include "spi_uvc_wr_seqs.sv"
   
   /** Virtual sequence*/
   `include "spi_uvc_virtual_sequence.sv"
  
   /** write virtual sequence */
   `include "spi_uvc_wr_vseqs.sv"
   `include "spi_uvc_b2b_wr_rd_vseqs.sv"
   `include "spi_uvc_b2b_wr_vseqs.sv"
   `include "spi_uvc_b2b_rd_vseqs.sv"
   /** Testcases*/  
   `include "spi_uvc_base_test.sv"

   `include "spi_uvc_sanity_test.sv"
   `include "spi_uvc_b2b_wr_rd_test.sv"
   `include "spi_uvc_b2b_wr_test.sv"
   `include "spi_uvc_b2b_rd_test.sv"
endpackage : spi_uvc_pkg
`endif /**SPI_UVC_PKG*/
