//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_slave_sequencer.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_SEQUENCER_SV
`define SPI_UVC_SLAVE_SEQUENCER_SV

class spi_uvc_slave_sequencer extends uvm_sequencer#(spi_uvc_transaction);
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_slave_sequencer);

   /** Analysis export and analysis fifo declaration for reactive agent*/
   uvm_analysis_export#(spi_uvc_transaction) item_export;
   
   uvm_tlm_analysis_fifo#(spi_uvc_transaction) item_fifo;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_sequencer",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
endclass : spi_uvc_slave_sequencer
`endif /**: SPI_UVC_SLAVE_SEQUENCER_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_sequencer::new(string name = "spi_uvc_slave_sequencer",uvm_component parent);
      super.new(name,parent);
      /** A analysis port for the connection to fifo*/
      item_export = new("item_export",this);

      /** A analysis fifo to store the transaction from the slave monitor*/
      item_fifo = new("item_fifo",this);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_slave_sequencer::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_slave_sequencer::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      /** Connecting the analysis port and the fifo*/
      item_export.connect(item_fifo.analysis_export);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   

