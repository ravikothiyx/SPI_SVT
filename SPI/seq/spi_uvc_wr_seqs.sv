//////////////////////////////////////////////// 
// File:          spi_uvc_wr_seqs.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////
`ifndef SPI_UVC_WR_SEQS_SV
`define SPI_UVC_WR_SEQS_SV
class spi_uvc_wr_seqs extends spi_uvc_mstr_base_seqs;

 /** factory registration */
 `uvm_object_utils(spi_uvc_wr_seqs)

 /** function new */
 extern function new(string name = "spi_uvc_wr_seqs");

 /** body task */
 extern task body();

endclass 
`endif

 /** function new */
 function spi_uvc_wr_seqs::new(string name = "spi_uvc_wr_seqs");
  super.new(name);
 endfunction

 /** body task */
 task spi_uvc_wr_seqs::body();
 `uvm_do_with(trans_h,{header[7] == 1'b1;})
  $display("write"); 
  trans_h.print();
 endtask
