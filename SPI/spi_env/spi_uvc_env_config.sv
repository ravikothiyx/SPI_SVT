//////////////////////////////////////////////// 
// File:          spi_uvc_env_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_ENV_CONFIG_SV
`define SPI_UVC_ENV_CONFIG_SV

class spi_uvc_env_config extends uvm_object;

   /** Master configuration and slave configuration class instance*/
   spi_uvc_master_config mstr_cfg_h;
   spi_uvc_slave_config slv_cfg_h;

   /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_uvc_env_config);

   /** Master mode
     * If set then master mode else in slave mode
     */
    bit mstr = 1;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_env_config");

endclass : spi_uvc_env_config
`endif //: SPI_UVC_ENV_CONFIG_SV

   /** Standard UVM Methods*/
   function spi_uvc_env_config::new(string name = "spi_uvc_env_config");
      super.new(name);
   endfunction : new
