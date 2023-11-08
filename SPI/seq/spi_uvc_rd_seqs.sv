//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_rd_seqs.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

`ifndef SPI_UVC_RD_SEQS_SV
`define SPI_UVC_RD_SEQS_SV

class spi_uvc_rd_seqs extends spi_uvc_mstr_base_seqs;

  /** Factory registration */
  `uvm_object_utils(spi_uvc_rd_seqs)

  /** Function new */
  extern function new(string name = "spi_uvc_rd_seqs");
 
  /** Task body*/
  extern task body();
endclass : spi_uvc_rd_seqs
`endif /** SPI_UVC_RD_SEQS_SV*/

  /** UVM Standard function*/
  function spi_uvc_rd_seqs::new(string name = "spi_uvc_rd_seqs");
    super.new(name);
  endfunction : new

  /** Body task for driving sequence item using uvm macros (uvm_do)*/
  task spi_uvc_rd_seqs::body();
    repeat(num_trans) begin
      `uvm_do_with(spi_trans_h,{header == 8'b0010_1010;})
      `uvm_info(get_full_name(),"READ",UVM_HIGH);
      spi_trans_h.print();
    end /** begin*/
  endtask : body