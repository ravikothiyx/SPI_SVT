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

  /** Factory registration*/
  `uvm_object_utils(spi_uvc_wr_seqs)

  /** Function new*/
  extern function new(string name = "spi_uvc_wr_seqs");

  /** Task body*/
  extern task body();
endclass : spi_uvc_wr_seqs
`endif /** SPI_UVC_WR_SEQS_SV*/

  /** Function new*/
  function spi_uvc_wr_seqs::new(string name = "spi_uvc_wr_seqs");
    super.new(name);
  endfunction

  /** Task body*/
  task spi_uvc_wr_seqs::body();
    repeat(num_trans)begin
      /** Creating and starting the write sequence on master sequencer*/
      `uvm_do_with(spi_trans_h,{header == 8'b1010_1010;})
      `uvm_info(get_full_name(),"WRITE",UVM_HIGH);

      /** Printing the transaction*/
      spi_trans_h.print();
    end /** begin*/
  endtask : body

