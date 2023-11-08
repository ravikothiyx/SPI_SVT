///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_wr_vseqs.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI 
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_WR_VSEQS_SV
`define SPI_UVC_WR_VSEQS_SV
class spi_uvc_wr_vseqs extends spi_uvc_virtual_sequence_vseq;
  /** UVM Factory Registration Macro*/
  `uvm_object_utils(spi_uvc_wr_vseqs);

  /** Standard UVM Methods*/ 
  extern function new(string name = "spi_uvc_wr_vseqs");
  
  /** Standard UVM Methods*/
  extern task body();

  /** Handles of sequences*/
  spi_uvc_wr_seqs spi_wr_seqs_h;
  spi_uvc_rd_seqs spi_rd_seqs_h; 
  spi_uvc_slv_seqs spi_svl_seqs_h; 
endclass : spi_uvc_wr_vseqs 
`endif /** SPI_UVC_VIRTUAL_SEQUENCE_SV*/


  /** Standard UVM Methods*/ 
  function spi_uvc_wr_vseqs::new(string name = "spi_uvc_wr_vseqs");
    super.new(name);
  endfunction : new

  /** Task body*/
  task spi_uvc_wr_vseqs::body();
    fork
      begin
        /** Creating and starting 2 back to back write then read sequence*/
        `uvm_do_on_with(spi_wr_seqs_h , spi_mstr_seqr_h,{num_trans==1;})
        `uvm_do_on_with(spi_rd_seqs_h , spi_mstr_seqr_h,{num_trans==1;})
      end 
    
      /** Slave sequence*/
     //`uvm_do_on(spi_svl_seqs_h , spi_slv_seqr_h) 
    join_any
  endtask : body 
