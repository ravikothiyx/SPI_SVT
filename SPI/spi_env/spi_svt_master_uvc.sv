//////////////////////////////////////////////// 
// File:          spi_svt_master_uvc.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////

`ifndef SPI_SVT_MASTER_UVC_SV
`define SPI_SVT_MASTER_UVC_SV

class spi_svt_master_uvc extends uvm_agent;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_svt_master_uvc);

   /** Master agent configuration class instance*/
   spi_svt_master_config mcfg_h;

   /** Master agent class instance*/
   spi_svt_master_agent magent_h[];

   /** Analysis port foe the agent to uvc connection*/
   uvm_analysis_port#(spi_svt_trans) u_mport;

   /** Standard UVM Methods*/
   extern function new(string name = "spi_svt_master_uvc",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_svt_master_uvc
`endif //: SPI_SVT_MASTER_UVC_SV

   /** Standard UVM Methods*/
   function spi_svt_master_uvc::new(string name = "spi_svt_master_uvc",uvm_component parent);
      super.new(name,parent);
      u_mport = new("u_mport",this);
   endfunction : new

   /** Build_phase*/
   function void spi_svt_master_uvc::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      
      /** Master agent config class creation*/
      mcfg_h = spi_svt_master_config::type_id::create("mcfg_h");

      /** Retriving the master configuration class*/
      uvm_config_db#(spi_svt_master_config)::set(this,"*","mcfg_h",mcfg_h);
      
      /** Creating master agent class*/
      magent_h = new[mcfg_h.no_of_agents];
      foreach(magent_h[i])
      begin
         magent_h[i] = spi_svt_master_agent::type_id::create($sformatf("magent_h[%0d]",i),this);
      end

      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_svt_master_uvc::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);

      /** Connecting master agent*/
      foreach(magent_h[i])begin
         magent_h[i].a_mport.connect(u_mport);
      end
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /** Run_phase*/
   task spi_svt_master_uvc::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
