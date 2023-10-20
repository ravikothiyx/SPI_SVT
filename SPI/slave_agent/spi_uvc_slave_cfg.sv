//////////////////////////////////////////////// 
// File:          spi_uvc_slave_cfg.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SLAVE_CFG_SV
`define SPI_UVC_SLAVE_CFG_SV

class spi_uvc_slave_cfg extends uvm_object;
   
    /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_uvc_slave_cfg)

   /** Data Members*/ 
   
   /** Configure agent as active or passive*/
   uvm_active_passive_enum is_active = UVM_ACTIVE;

   /** Enable or diable slave coverage */
   int enable_cov = 0;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_slave_cfg");

endclass : spi_uvc_slave_cfg

`endif /** SPI_UVC_SLAVE_CFG_SV*/

   /** Standard UVM Methods*/
   function spi_uvc_slave_cfg::new(string name = "spi_uvc_slave_cfg");
      super.new(name);
   endfunction : new
