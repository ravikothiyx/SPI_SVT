///////////////////////////////////////////////
// Company:       SCALEDGE
// File:          spi_uvc_slv_seqs.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI 
// Discription:    
/////////////////////////////////////////////////

`ifndef SPI_UVC_SLV_SEQS_SV
`define SPI_UVC_SLV_SEQS_SV

class spi_uvc_slv_seqs extends spi_uvc_slv_base_seqs;
   /** UVM Factory Registration Macro */
   `uvm_object_utils(spi_uvc_slv_seqs);

   /** Virtual interface instance*/
   virtual spi_uvc_if vif;

   /** Variable to store data temporary*/
   bit[`DATA_WIDTH-1:0]temp_mosi;

   /** Slave Sequencer instance*/
   spi_uvc_slave_sequencer p_sequencer;

   /** Standard UVM Methods: */  
   function new(string name = "spi_uvc_slv_seqs");
      super.new(name);
   endfunction : new

   /** body task */ 
   task body();
         `uvm_info(get_type_name(),"Inside slave sequence task body",UVM_LOW);
      `uvm_info(get_type_name(),"START OF THE BASE SEQUENCE BODY",UVM_LOW);

      /** Retriving Virtual interface*/
      if(!uvm_config_db#(virtual spi_uvc_if)::get(null,"","vif",vif))
         `uvm_fatal(get_full_name(),"Not able to get the virtual interface!");

      /** Pointing the p_sequencer to m_seqeuncer*/
      if(!$cast(p_sequencer,m_sequencer))
         `uvm_fatal(get_full_name(),"p_sequencer casting failed!");

      forever begin
         `uvm_info(get_type_name(),"Inside slave sequence forever loop",UVM_LOW);
         /** Taking the data from the sequrncer fifo using the get method of the tlm fifo*/ 
         p_sequencer.item_fifo.get(trans_h);
         /** Checking the 8th bit for the transaction type(read(0),write(1))*/
         case(trans_h.header[7])

            /** 8th bit is high so write transaction*/
            1'b1 : begin
                     /** Storing the write data into a temporary variable*/
                     temp_mosi = trans_h.wr_data;
                   end //begin
            /** 8th bit is low so read transaction*/
            1'b0 : begin
                      trans_h.header.rand_mode(0);
                      if(!trans_h.randomize())
                        `uvm_fatal(get_full_name(),"Randomization failed!");
                     
                     trans_h.print();
                     /**trans_h.rd_data = 8'b1010_1010;*/
                     /** Sending the transaction to the driver using `uvm_send macro*/
                     `uvm_info(get_type_name(),$sformatf("\n%s",trans_h.sprint()),UVM_LOW); 
                     /**trans_h.rd_data = temp_mosi;*/
                     `uvm_send(trans_h)
                   end /** begin*/ 
         endcase
      end /** forever*/
      `uvm_info(get_type_name(),"END OF THE BASE SEQUENCE BODY",UVM_LOW);
   endtask : body 
endclass : spi_uvc_slv_seqs
`endif /** : SPI_UVC_SLV_SEQS_SV */
