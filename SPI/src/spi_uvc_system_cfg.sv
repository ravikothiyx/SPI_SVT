//////////////////////////////////////////////// 
// File:          spi_uvc_system_cfg.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_SYSTEM_CFG_SV
`define SPI_UVC_SYSTEM_CFG_SV

class spi_uvc_system_cfg extends uvm_object;

   /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_uvc_system_cfg);

   /** Master mode
     * If set then master mode else in slave mode
     */
    bit mstr = 1;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_system_cfg");

endclass : spi_uvc_system_cfg
`endif //: SPI_UVC_SYSTEM_CFG_SV

   /** Standard UVM Methods*/
   function spi_uvc_system_cfg::new(string name = "spi_uvc_system_cfg");
      super.new(name);
   endfunction : new
