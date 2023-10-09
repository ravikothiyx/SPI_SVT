//////////////////////////////////////////////// 
// File:          spi_svt_env_config.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_SVT_ENV_CONFIG_SV
`define SPI_SVT_ENV_CONFIG_SV

class spi_svt_env_config extends uvm_object;
   
   /** UVM Factory Registration Macro*/
   `uvm_object_utils(spi_svt_env_config);

<<<<<<< HEAD
   /** To enable or disable the scoreboard**/
   int enable_sb = 1;

   /** Standard UVM Methods*/
=======
   //To enable or disable the scoreboard
   int enable_sb = 1;

   // Standard UVM Methods
>>>>>>> ca595c3c8e7b85092f7ac4e5a5dea8a1b54e242b
   function new(string name = "spi_svt_env_config");
      super.new(name);
   endfunction : new
endclass : spi_svt_env_config
<<<<<<< HEAD
`endif /** SPI_SVT_ENV_CONFIG_SV*/
=======
`endif //: SPI_SVT_ENV_CONFIG_SV
>>>>>>> ca595c3c8e7b85092f7ac4e5a5dea8a1b54e242b
