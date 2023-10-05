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
   spi_svt_env_config env_cfg;

   //------------------------------------------
   // Methods
   //------------------------------------------

   // Standard UVM Methods:  
   function new(string name = "spi_svt_base_test",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

     //Creating environment config
     //
      //env_cfg = apb_env_config::type_id::create("env_cfg");
      
  
      //uvm_config_db#(apb_env_config)::set(this,"*","env_cfg",env_cfg);

      //Creating the Environment
      //env_h = apb_env::type_id::create("env_h",this);
      
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

      //End_of_elaboration_phase
   function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info(get_type_name(),"INSIDE END_OF_ELABORATION_PHASE",UVM_FULL);
      //Displaying Topology
      //uvm_top.print_topology();
   endfunction : end_of_elaboration_phase

   //run phase
   task run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      phase.raise_objection(this);

      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      phase.drop_objection(this);

      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
endclass : spi_svt_base_test

`endif //: SPI_SVT_BASE_TEST_SV
