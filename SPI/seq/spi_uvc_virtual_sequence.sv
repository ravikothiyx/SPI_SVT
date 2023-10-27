///////////////////////////////////////////////
// File:          spi_uvc_virtual_sequence.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_VIRTUAL_SEQUENCE_SV
`define SPI_UVC_VIRTUAL_SEQUENCE_SV

class spi_uvc_virtual_sequence_vseq extends uvm_sequence#(uvm_sequence_item);
  /**  UVM Factory Registration Macro*/
   
   `uvm_object_utils(spi_uvc_virtual_sequence_vseq);

   /** Standard UVM Methods: */ 
   extern function new(string name = "spi_uvc_virtual_sequence_vseq");

  /** virtual sequencer handle*/
 `uvm_declare_p_sequencer(spi_uvc_virtual_sequencer);

 /** sequencer handles*/

 /** master sequencer instance */
 spi_uvc_master_sequencer spi_mstr_seqr_h;
/** Slave sequencer instance */
 spi_uvc_slave_sequencer  spi_slv_seqr_h;


 /** pre body */
task pre_body();
 /** casting between p_sequencer and m_sequencer */
 if(!$cast(p_sequencer,m_sequencer))
  `uvm_fatal(get_full_name(),"virtual sequencer casting failed!")

/**instance assigment for master and Slave sequencer*/
 spi_mstr_seqr_h = p_sequencer.mseqr_h;
 spi_slv_seqr_h  = p_sequencer.sseqr_h;

endtask


endclass : spi_uvc_virtual_sequence_vseq
`endif /** : SPI_UVC_VIRTUAL_SEQUENCE_SV */


   /** Standard UVM Methods: */ 
   function spi_uvc_virtual_sequence_vseq::new(string name = "spi_uvc_virtual_sequence_vseq");
      super.new(name);
   endfunction : new
