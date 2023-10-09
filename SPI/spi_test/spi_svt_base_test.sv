//////////////////////////////////////////////// 
// File:          spi_svt_base_test.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


//
// Class Description:
//
//
`ifndef SPI_SVT_BASE_TEST_SV
`define SPI_SVT_BASE_TEST_SV

class spi_svt_base_test extends uvm_test;
   // UVM Factory Registration Macro
   //
   `uvm_component_utils(spi_svt_base_test);

   //Envoronment config class instance
   //
   spi_svt_env_config ecfg_h;

   //env class instance
   //
   spi_svt_env env_h;

   //------------------------------------------
   // Methods
   //------------------------------------------

   // Standard UVM Methods:  
   extern function new(string name = "spi_svt_base_test",uvm_component parent);

   //build_phase
   extern function void build_phase(uvm_phase phase);

   //End_of_elaboration_phase
   extern function void end_of_elaboration_phase(uvm_phase phase);

   //run phase
   extern task run_phase(uvm_phase phase);

endclass : spi_svt_base_test

`endif //: SPI_SVT_BASE_TEST_SV

   // Standard UVM Methods:  
   function spi_svt_base_test::new(string name = "spi_svt_base_test",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void spi_svt_base_test::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      //Creating environment config
      //
      ecfg_h = spi_svt_env_config::type_id::create("ecfg_h");
      
      uvm_config_db#(spi_svt_env_config)::set(this,"*","ecfg_h",ecfg_h);

      //Creating the Environment
      //
      env_h = spi_svt_env::type_id::create("env_h",this);
      
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   //End_of_elaboration_phase
   function void spi_svt_base_test::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info(get_type_name(),"INSIDE END_OF_ELABORATION_PHASE",UVM_FULL);
      //Displaying Topology
      //
      uvm_top.print_topology();
   endfunction : end_of_elaboration_phase

   //run phase
   task spi_svt_base_test::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      phase.raise_objection(this);

      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      phase.drop_objection(this);

      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
