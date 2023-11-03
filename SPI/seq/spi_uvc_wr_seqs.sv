//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_wr_seqs.sv
// Version:       1.0
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
 repeat(num_trans)begin
 `uvm_do_with(trans_h,{header == 8'b1010_1010;})
  `uvm_info(get_full_name(),"WRITE",UVM_HIGH);
  trans_h.print();
end
 endtask
