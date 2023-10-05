//////////////////////////////////////////////// 
// File:          spi_svt_inf.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`timescale 10ns/1ps
interface spi_svt_inf();

   //Clocking block declaration for driver
  /* clocking drv_cb @(posedge);
     default input #1 output #0; 
  endclocking

   //Clocking block declaration for monitor
   clocking mon_cb@(posedge);
      default input #1 output #0;
   endclocking

   //Modport for the driver
   modport DRV_MP(clocking drv_cb);

   //Modport for the monitor
   modport MON_MP(clocking mon_cb);*/
endinterface : spi_svt_inf
