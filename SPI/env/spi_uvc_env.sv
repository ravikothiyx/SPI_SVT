//////////////////////////////////////////////// 
// File:          spi_uvc_env.sv
// Version:       v1
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_ENV_SV
`define SPI_UVC_ENV_SV

class spi_uvc_env extends uvm_env;
   
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_env);

   /** Master and Salve agent cfg instances*/
   spi_uvc_master_cfg mstr_cfg_h;
   spi_uvc_slave_cfg  slv_cfg_h;

   /** Master and Salve agent instances*/
   spi_uvc_master_agent mstr_agent_h;
   spi_uvc_slave_agent  slv_agent_h;

   /** Environment class instance*/
   spi_uvc_system_cfg sys_cfg_h;

   /** Virtual seqeuncer instance*/
   spi_uvc_virtual_sequencer vseqr_h;

   /** scoreboard classs instance*/
   spi_uvc_sb spi_sb_h;   

   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_env",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Connect_phase*/
   extern function void connect_phase(uvm_phase phase);
   
   /** Run_phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_env
`endif //: SPI_UVC_ENV_SV

   /** Standard UVM Methods*/
   function spi_uvc_env::new(string name = "spi_uvc_env",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_env::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      /** Retriving the Environment cfg class*/
      if(!uvm_config_db#(spi_uvc_system_cfg)::get(this,"","sys_cfg_h",sys_cfg_h))
         `uvm_fatal(get_full_name(),"Not able to get the environment cfg");
      
       spi_sb_h = spi_uvc_sb::type_id::create("spi_sb_h",this);
      
        //if(sys_cfg_h.mstr == 1'b1) begin
         /** Creating master cfguration*/
         mstr_cfg_h = spi_uvc_master_cfg::type_id::create("mstr_cfg_h",this);

         /** Creating the master agent class*/
         mstr_agent_h = spi_uvc_master_agent::type_id::create("mstr_agent_h",this);

         /** Master agent cfguration class is set*/
         uvm_config_db#(spi_uvc_master_cfg)::set(this,"*","mstr_cfg_h",mstr_cfg_h);
      //end /** if*/

      //if(sys_cfg_h.mstr == 1'b0) begin
         /** Creating slave cfguration*/
         slv_cfg_h = spi_uvc_slave_cfg::type_id::create("slv_cfg_h",this);
         
         /** Creating the master agent class*/
         slv_agent_h = spi_uvc_slave_agent::type_id::create("slv_agent_h",this);

         /** Slave agent cfguration class is set*/
         uvm_config_db#(spi_uvc_slave_cfg)::set(this,"*","slv_cfg_h",slv_cfg_h);

      //end /** if*/
        
      `uvm_info(get_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);
      
      /** Creating the virtual sequencer*/
      vseqr_h = spi_uvc_virtual_sequencer::type_id::create("vseqr_h",this);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Connect_phase*/
   function void spi_uvc_env::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info(get_type_name(),"START OF CONNECT_PHASE",UVM_HIGH);
      `uvm_info(get_name(),"INSIDE CONNECT_PHASE",UVM_DEBUG);
     
        mstr_agent_h.mstr_mon_h.item_collected_port.connect(spi_sb_h.spi_mstr_mon_sb);
        slv_agent_h.slv_mon_h.item_collected_port.connect(spi_sb_h.spi_slv_mon_sb);
       //if(sys_cfg_h.mstr == 1'b1) begin
        vseqr_h.mseqr_h = mstr_agent_h.mstr_seqr_h;
       //end
       //if(sys_cfg_h.mstr == 1'b0) begin
        vseqr_h.sseqr_h = slv_agent_h.slv_seqr_h;
       //end
      `uvm_info(get_type_name(),"END OF CONNECT_PHASE",UVM_HIGH);
   endfunction : connect_phase
   
   /**Run_phase*/
   task spi_uvc_env::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
