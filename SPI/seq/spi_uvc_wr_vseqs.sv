///////////////////////////////////////////////
// File:          spi_uvc_wr_vseqs.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_WR_VSEQS_SV
`define SPI_UVC_WR_VSEQS_SV


class spi_uvc_wr_vseqs extends spi_uvc_virtual_sequence_vseq;
  /**  UVM Factory Registration Macro*/
   
   `uvm_object_utils(spi_uvc_wr_vseqs);

   /** Standard UVM Methods: */ 
   extern function new(string name = "spi_uvc_wr_vseqs");
  
   /** Standard UVM Methods */
   extern task body();

   /** handles of sequences */
   spi_uvc_wr_seqs wr_seqs_h;
   spi_uvc_rd_seqs rd_seqs_h; 
   spi_uvc_slv_seqs slv_seqs_h; 
endclass 
`endif /** : SPI_UVC_VIRTUAL_SEQUENCE_SV */


   /** Standard UVM Methods: */ 
   function spi_uvc_wr_vseqs::new(string name = "spi_uvc_wr_vseqs");
      super.new(name);
   endfunction : new

  /** task body()*/
 
  task spi_uvc_wr_vseqs::body();
     fork
      begin
         `uvm_do_on(wr_seqs_h , spi_mstr_seqr_h)
         `uvm_do_on(rd_seqs_h , spi_mstr_seqr_h)
      end 
    
      `uvm_do_on(slv_seqs_h , spi_slv_seqr_h) 
     join_any
  endtask  
