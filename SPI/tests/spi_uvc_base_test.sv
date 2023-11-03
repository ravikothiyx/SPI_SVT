//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_base_test.sv
// Version:       1.0
// Developer:     
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_BASE_TEST_SV
`define SPI_UVC_BASE_TEST_SV

class spi_uvc_base_test extends uvm_test;
   /** UVM Factory Registration Macro */
   `uvm_component_utils(spi_uvc_base_test);

   /** Envoronment config class instance */
   spi_uvc_system_cfg sys_cfg_h;

   /** env class instance */
   spi_uvc_system_cfg cfg_h;

   /** Register class instance*/
   spi_uvc_reg_cfg reg_cfg_h;

   /** Environment class instance*/
   spi_uvc_env env_h;

  /** virtual sequ

   /** Standard UVM Methods: */  
   extern function new(string name = "spi_uvc_base_test",uvm_component parent);

   /** Build_phase */
   extern function void build_phase(uvm_phase phase);

   /** End_of_elaboration_phase */
   extern function void end_of_elaboration_phase(uvm_phase phase);

   /** Run phase */
   extern task run_phase(uvm_phase phase);

endclass : spi_uvc_base_test
`endif //: SPI_UVC_BASE_TEST_SV

   /** Standard UVM Methods: */ 
   function spi_uvc_base_test::new(string name = "spi_uvc_base_test",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** build_phase */
   function void spi_uvc_base_test::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

      /** Creating register config */
      reg_cfg_h = spi_uvc_reg_cfg::type_id::create("reg_cfg_h");

      /** Set the register configuration */
      uvm_config_db#(spi_uvc_reg_cfg)::set(this,"*","reg_cfg_h",reg_cfg_h);

      /** Creating environment config */
      sys_cfg_h = spi_uvc_system_cfg::type_id::create("sys_cfg_h");
      
      /** Set the system configuration*/
      uvm_config_db#(spi_uvc_system_cfg)::set(this,"*","sys_cfg_h",sys_cfg_h);

      /** Creating the Environment */
      env_h = spi_uvc_env::type_id::create("env_h",this);
      
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** End_of_elaboration_phase */
   function void spi_uvc_base_test::end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      `uvm_info(get_type_name(),"INSIDE END_OF_ELABORATION_PHASE",UVM_FULL);
      /** Displaying Topology */
       `uvm_info(get_type_name(),$sformatf("\n%p",this.sprint),UVM_LOW);
   endfunction : end_of_elaboration_phase

   /** Run phase */
   task spi_uvc_base_test::run_phase(uvm_phase phase);
      `uvm_info(get_type_name(),"START OF RUN_PHASE",UVM_HIGH);
      phase.raise_objection(this);
      `uvm_info(get_type_name(),"INSIDE RUN_PHASE",UVM_DEBUG);
      phase.drop_objection(this);
      `uvm_info(get_type_name(),"END OF RUN_PHASE",UVM_HIGH);
   endtask : run_phase
