//////////////////////////////////////////////// 
// File:          spi_uvc_agent_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_UVC_AGENT_CONFIG_SV
`define SPI_UVC_AGENT_CONFIG_SV

class spi_uvc_agent_config extends uvm_object;

   /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_uvc_agent_config)
 
   /** Data Members*/ 

   /** Configure agent as active or passive*/   
   uvm_active_passive_enum is_active = UVM_PASSIVE;
 
   /** Enable coverage*/
   int enable_cov = 1;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_agent_config");

endclass : spi_uvc_agent_config
`endif //: SPI_UVC_AGENT_CONFIG_SV

   /** Standard UVM Methods*/
   function spi_uvc_agent_config::new(string name = "spi_uvc_agent_config");
      super.new(name);
   endfunction : new
