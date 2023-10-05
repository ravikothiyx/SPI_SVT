//////////////////////////////////////////////// 
// File:          spi_svt_master_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`ifndef SPI_SVT_MASTER_CONFIG_SV
`define SPI_SVT_MASTER_CONFIG_SV

class spi_svt_master_config extends uvm_object;
   
   // UVM Factory Registration Macro
   //
   `uvm_object_utils(spi_svt_master_config);

   // Standard UVM Methods
   function new(string name = "spi_svt_master_config");
      super.new(name);
   endfunction : new
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_master_config
`endif //: SPI_SVT_MASTER_CONFIG_SV