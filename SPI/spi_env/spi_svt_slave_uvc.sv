//////////////////////////////////////////////// 
// File:          spi_svt_slave_uvc.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_SVT_SLAVE_UVC_SV
`define SPI_SVT_SLAVE_UVC_SV

class spi_svt_slave_uvc extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_slave_uvc);

   /**slave config class instance*/
   spi_svt_slave_config scfg_h;

   /**salve agent class instance*/
   spi_svt_slave_agent sagent_h[];

   /**Analysis port*/
   uvm_analysis_port#(spi_svt_trans) u_sport;

   /**Standard UVM Methods*/
   function new(string name = "spi_svt_slave_uvc",uvm_component parent);
      super.new(name,parent);
      u_sport = new("u_sport",this);
   endfunction : new

   /**build_phase*/
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /**creating slave configuration class*/
      scfg_h = spi_svt_slave_config::type_id::create("scfg_h");

      
      /** setting values for config data members*/
      uvm_config_db#(spi_svt_slave_config)::set(this,"*","scfg_h",scfg_h);

      /**creating slave agent*/
      sagent_h = new[scfg_h.no_of_agents];

      /** loop for creating numbers of slave agent*/

      foreach(sagent_h[i])
      begin
         sagent_h[i] = spi_svt_slave_agent::type_id::create($sformatf("sagent_h[%0d]",i),this);
      end
      
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /**connect_phase*/

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
       
      foreach(sagent_h[i])begin
         sagent_h[i].a_sport.connect(u_sport);
      end 

      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**run_phase*/
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_slave_uvc
`endif /**: SPI_SVT_SLAVE_UVC_SV*/
