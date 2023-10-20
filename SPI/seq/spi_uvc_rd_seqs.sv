//////////////////////////////////////////////// 
// File:          spi_uvc_rd_seqs.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

class spi_uvc_rd_seqs extends spi_uvc_mstr_base_seqs;

 /** factory registration */
 `uvm_object_utils(spi_uvc_rd_seqs)

 /** function new */
 extern function new(string name = "spi_uvc_rd_seqs");
 
 extern task body();


endclass

 function spi_uvc_rd_seqs::new(string name = "spi_uvc_rd_seqs");
  super.new(name);
 endfunction

 task spi_uvc_rd_seqs::body();
  `uvm_do_with(trans_h,{header[7] == 0;})
  $display("read");
  trans_h.print();
 endtask
  
