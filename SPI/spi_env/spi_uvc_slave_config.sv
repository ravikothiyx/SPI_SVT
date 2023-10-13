//////////////////////////////////////////////// 
// File:          spi_uvc_slave_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_CONFIG_SV
`define SPI_UVC_SLAVE_CONFIG_SV

class spi_uvc_slave_config extends uvm_object;
   
    /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_uvc_slave_config)

   /** Data Members*/ 
   
   /** Configure agent as active or passive*/
   uvm_active_passive_enum is_active = UVM_ACTIVE;

   /** Enable or diable slave coverage */
   int enable_cov = 1'b1;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_config");

endclass : spi_uvc_slave_config

`endif /** SPI_UVC_SLAVE_CONFIG_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_config::new(string name = "spi_uvc_slave_config");
      super.new(name);
   endfunction : new
