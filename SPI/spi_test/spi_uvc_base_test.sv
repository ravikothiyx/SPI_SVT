//////////////////////////////////////////////// 
// File:          spi_uvc_base_test.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_BASE_TEST_SV
`define SPI_UVC_BASE_TEST_SV

class spi_uvc_base_test extends uvm_test;
   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_base_test);

   /** Envoronment config class instance*/
   spi_uvc_env_config env_cfg_h;

   /** Env class instance*/
   spi_uvc_env env_h;
   
   /** Register class instance*/
   spi_uvc_reg_config reg_cfg_h;

   /** Standard UVM Methods:*/  
   extern function new(string name = "spi_uvc_base_test",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** End_of_elaboration_phase*/
   extern function void end_of_elaboration_phase(uvm_phase phase);

   /** Run phase*/
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_base_test
`endif //: SPI_UVC_BASE_TEST_SV

   /** Standard UVM Methods:*/ 
   function spi_uvc_base_test::new(string name = "spi_uvc_base_test",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** build_phase*/     
   function void spi_uvc_base_test::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      /** Creating environment config */
      reg_cfg_h = spi_uvc_reg_config::type_id::create("reg_cfg_h");

      /** Creating environment config */
      env_cfg_h = spi_uvc_env_config::type_id::create("env_cfg_h");
      
      /** Environment configuration class set*/
      uvm_config_db#(spi_uvc_env_config)::set(this,"*","env_cfg_h",env_cfg_h);

      /** Creating the Environment*/
      env_h = spi_uvc_env::type_id::create("env_h",this);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** End_of_elaboration_phase*/
   function void spi_uvc_base_test::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info(get_type_name(),"INSIDE END_OF_ELABORATION_PHASE",UVM_FULL);
      /** Displaying Topology*/
      uvm_top.print_topology();
   endfunction : end_of_elaboration_phase

   /** Run phase*/
   task spi_uvc_base_test::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      phase.raise_objection(this);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      phase.drop_objection(this);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
