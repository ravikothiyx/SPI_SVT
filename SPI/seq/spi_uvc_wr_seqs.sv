//////////////////////////////////////////////// 
// File:          spi_uvc_wr_seqs.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

class spi_uvc_wr_seqs extends spi_uvc_mstr_base_seqs;

 /** factory registration */
 `uvm_object_utils(spi_uvc_wr_seqs)

 /** function new */
 function new(string name = "spi_uvc_wr_seqs");
  super.new(name);
 endfunction

 /** body task */
 task body();
 `uvm_do_with(trans_h,{header[7] == 1'b1;})
  trans_h.print();
 /* trans_h = spi_uvc_transaction::type_id::create("trans_h");
  `uvm_info(get_full_name(),"after trans_h item",UVM_LOW)
  start_item(trans_h);
  `uvm_info(get_full_name(),"after start item",UVM_LOW)
  assert(trans_h.randomize() with {header[7] ==1 ;});
  finish_item(trans_h); */
//  `uvm_do(trans_h);

 endtask

endclass 


