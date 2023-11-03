///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_b2b_wr_rd_vseqs.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_B2B_WR_RD_VSEQS_SV
`define SPI_UVC_B2B_WR_RD_VSEQS_SV



class spi_uvc_b2b_wr_rd_vseqs extends spi_uvc_virtual_sequence_vseq;
  /**  UVM Factory Registration Macro*/
   
   `uvm_object_utils(spi_uvc_b2b_wr_rd_vseqs);

   /** Standard UVM Methods: */ 
   extern function new(string name = "spi_uvc_b2b_wr_rd_vseqs");
  
   /** Standard UVM Methods */
   extern task body();

   /** handles of sequences */
   spi_uvc_wr_seqs wr_seqs_h;
   spi_uvc_rd_seqs rd_seqs_h; 
   spi_uvc_slv_seqs slv_seqs_h; 
endclass 
`endif /** : SPI_UVC_VIRTUAL_SEQUENCE_SV */


   /** Standard UVM Methods: */ 
   function spi_uvc_b2b_wr_rd_vseqs::new(string name = "spi_uvc_b2b_wr_rd_vseqs");
      super.new(name);
   endfunction : new

  /** task body()*/
 
  task spi_uvc_b2b_wr_rd_vseqs::body();
     fork
      begin
  /** scenerio for back to back write and read transaction from master side */
       repeat(9) begin
         `uvm_do_on_with(wr_seqs_h , spi_mstr_seqr_h,{num_trans==1;})
         `uvm_do_on_with(rd_seqs_h , spi_mstr_seqr_h,{num_trans==1;})
       end 
      end
    
      `uvm_do_on(slv_seqs_h , spi_slv_seqr_h) 
     join_any
  endtask  
