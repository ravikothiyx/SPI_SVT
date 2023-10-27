//////////////////////////////////////////////// 
// File:          spi_uvc_mstr_base_seqs.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

class spi_uvc_mstr_base_seqs extends uvm_sequence#(spi_uvc_transaction);

 /** factory registration*/
 `uvm_object_utils(spi_uvc_mstr_base_seqs)

 /** transcation class instansiation*/
 spi_uvc_transaction trans_h;

 rand int num_trans;
 
 /** function new*/
 function new(string name = "spi_uvc_mstr_base_seqs");
  super.new(name);
 endfunction

endclass
 

