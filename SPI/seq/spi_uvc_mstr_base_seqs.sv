//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_mstr_base_seqs.sv
// Version:       1.0`
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

class spi_uvc_mstr_base_seqs extends uvm_sequence#(spi_uvc_transaction);

  /** Factory registration*/
  `uvm_object_utils(spi_uvc_mstr_base_seqs)

  /** Transcation class instansiation*/
  spi_uvc_transaction spi_trans_h;

  /** Count for number of transaction*/
  rand int num_trans;
 
  /** Function new*/
  function new(string name = "spi_uvc_mstr_base_seqs");
    super.new(name);
  endfunction
endclass : spi_uvc_mstr_base_seqs
 

