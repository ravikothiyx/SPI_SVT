//////////////////////////////////////////////// 
// File:          spi_uvc_assertion.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////

interface spi_uvc_assertions(input logic bclk,input logic sclk,input logic ss_n,input logic mosi,input logic miso);

   int final_freq;
   real time_period = 8;
   int devisor;
   int base_freq;

   //spi_uvc_reg_cfg spi_reg_cfg_h;
/*
   initial begin

      if(!uvm_config_db#(spi_uvc_reg_cfg)::exists(null,"","spi_reg_cfg_h"))

      if(!uvm_config_db#(spi_uvc_reg_cfg)::get(null,"","spi_reg_cfg_h",spi_reg_cfg_h))
         `uvm_fatal("SPI_ASSERTIONS","Not able to get the register config");

      devisor = (spi_reg_cfg_h.SPIBR[6:4] + 'b1)*(2**(spi_reg_cfg_h.SPIBR[2:0]+'b1));
      final_freq = base_freq/devisor;
      time_period  = 1/final_freq;
   end /** initial*/

   property sclk_freq;
      realtime current_time;
      @(posedge bclk)
         disable iff(ss_n)
            @(posedge sclk)(1,current_time = $realtime) |=> @(posedge sclk)(time_period == ($realtime - current_time));
   endproperty : sclk_freq

   property slave_select_n;
      @(posedge bclk)
         $fell(ss_n) |-> ##[0:$] $rose(ss_n)
   endproperty : slave_select_n

   property polarity;
      @(posedge bclk)
         ss_n |-> !sclk
   endproperty : polarity

   property miso_check;
      bit temp;
      @(posedge sclk)
         (!ss_n) |-> ((miso == 'bz));
   endproperty : miso_check
   
   property ss_assert_check;
     @(posedge sclk)
       !ss_n;
   endproperty : ss_assert_check

   ERROR_SCLK_FREQ_FAILED:assert property(sclk_freq)
   else
      `uvm_error("SPI_UVC_ASSRTIONS","CLOCK FAILED!!\n")

   ERROR_SLAVE_SELECT_FAILED:assert property(slave_select_n)
   else
      `uvm_error("SPI_UVC_ASSRTIONS","SLAVE SELECT FAILED!!\n")

   ERROR_POLARITY_FAILED:assert property(polarity)
   else
      `uvm_error("SPI_UVC_ASSRTIONS","POLARITY FAILED!!\n")
   
   ERROR_SLAVE_SELECT_ASSERT_FAILED:assert property(ss_assert_check)
   else
      `uvm_error("SPI_UVC_ASSRTIONS","SLAVE SELECT DEASSERTED IN BETWEEN!!\n");

endinterface : spi_uvc_assertions


