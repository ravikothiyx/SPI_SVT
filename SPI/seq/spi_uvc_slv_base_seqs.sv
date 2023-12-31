//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_slv_base_seqs.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:   This file contains the base sequence for read transactions
/////////////////////////////////////////////////

class spi_uvc_slv_base_seqs extends uvm_sequence#(spi_uvc_transaction);

  /** Factory registration*/
  `uvm_object_utils(spi_uvc_slv_base_seqs)

  /** Transcation class instansiation*/
  spi_uvc_transaction spi_trans_h;

  /** Slave Memory */
  /**bit [`DATA_WIDTH -1 :0] mem [int];*/


  /**`uvm_declare_p_sequencer(spi_uvc_sequencer)*/

  /** Function new*/
  function new(string name = "spi_uvc_slv_base_seqs");
    super.new(name);
  endfunction : new
  
  /** Task body*/
  /** 
  task body();
   forever begin
   p_sequencer.item_collected_fifo.get(trans_h);
   start_item(trans_h);
   if (trans_h.header[0]== 1 ) begin
    mem[trans_h.header[7:1]] = trans_h.wr_data;
  */  
endclass : spi_uvc_slv_base_seqs
 
