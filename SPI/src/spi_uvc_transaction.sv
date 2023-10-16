//////////////////////////////////////////////// 
// File:          spi_uvc_transaction.sv
// Version:       v1
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_TRANSACTION_SV
`define SPI_UVC_TRANSACTION_SV

class spi_uvc_transaction extends uvm_sequence_item;
   `uvm_object_utils_begin(spi_uvc_transaction)
   `uvm_object_utils_end

   function new(string name = "spi_uvc_transaction");
      super.new(name);
   endfunction : new
endclass :spi_uvc_transaction
`endif 
