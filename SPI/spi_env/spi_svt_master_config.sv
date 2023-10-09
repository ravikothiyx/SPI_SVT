//////////////////////////////////////////////// 
// File:          spi_svt_master_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_SVT_MASTER_CONFIG_SV
`define SPI_SVT_MASTER_CONFIG_SV

class spi_svt_master_config extends uvm_object;
 
   /** Data Members*/ 
   

   /**configure agent as active or passiv   
   uvm_active_passive_enum is_active = UVM_ACTIVE;

   //number of agent in the environment
   //
   int no_of_agents = 1;

   // UVM Factory Registration Macro
   //
   `uvm_object_utils_begin(spi_svt_master_config)
     `uvm_field_enum(uvm_active_passive_enum,is_active,UVM_DEFAULT)
     `uvm_field_int(no_of_agents,UVM_DEFAULT)
   `uvm_object_utils_end

   // Standard UVM Methods
   function new(string name = "spi_svt_master_config");
      super.new(name);
   endfunction : new

endclass : spi_svt_master_config
`endif //: SPI_SVT_MASTER_CONFIG_SV
