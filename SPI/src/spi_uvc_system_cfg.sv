//////////////////////////////////////////////// 
//Company:       SCALEDGE
// File:          spi_uvc_system_cfg.sv
// Version:       1.0
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

typedef enum bit {SLV,MSTR} mstr_slv_mode;

`ifndef SPI_UVC_SYSTEM_CFG_SV
`define SPI_UVC_SYSTEM_CFG_SV

class spi_uvc_system_cfg extends uvm_object;

  /** UVM Factory Registration Macro*/
  `uvm_object_utils(spi_uvc_system_cfg);

  /** Master mode
    * If set then master mode else in slave mode
   */
  mstr_slv_mode mstr_slv_mode_e = SLV;
  
  /** Standard UVM Methods*/
  extern function new(string name = "spi_uvc_system_cfg");
endclass : spi_uvc_system_cfg
`endif /** SPI_UVC_SYSTEM_CFG_SV*/

  /** Standard UVM Methods*/
  function spi_uvc_system_cfg::new(string name = "spi_uvc_system_cfg");
    super.new(name);
  endfunction : new
