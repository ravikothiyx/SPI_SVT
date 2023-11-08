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
   
  /** UVM Factory Registration Macro*/
  `uvm_component_utils(spi_uvc_base_test);

  /** Envoronment config class instance*/
  spi_uvc_system_cfg spi_sys_cfg_h;

  /** Register config class instance*/
  spi_uvc_reg_cfg spi_reg_cfg_h;

  /** Environment class instance*/
  spi_uvc_env spi_env_h;

  /** Standard UVM Methods*/  
  extern function new(string name = "spi_uvc_base_test",uvm_component parent);

  /** Build_phase*/
  extern function void build_phase(uvm_phase phase);

  /** End_of_elaboration_phase */
  extern function void end_of_elaboration_phase(uvm_phase phase);

  /** Run phase*/
  extern task run_phase(uvm_phase phase);

  /** Configfunction to take data from the commandline*/
  extern function void config_func(output bit[7:0] reg0,reg1,reg2,reg3);

   extern function void config_func(output bit[7:0] reg0,reg1,reg2,reg3);

endclass : spi_uvc_base_test
`endif /** SPI_UVC_BASE_TEST_SV*/

  /** Standard UVM Methods*/ 
  function spi_uvc_base_test::new(string name = "spi_uvc_base_test",uvm_component parent);
    super.new(name,parent);
  endfunction : new

  /** Build_phase*/
  function void spi_uvc_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
    `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_DEBUG);

    /** Creating register config*/
    spi_reg_cfg_h = spi_uvc_reg_cfg::type_id::create("spi_reg_cfg_h");

    /** Calling the config_func to set the data of the register configuration from
          * commandline for each environment*/
    config_func(spi_reg_cfg_h.SPICR1,spi_reg_cfg_h.SPICR2,spi_reg_cfg_h.SPIBR,spi_reg_cfg_h.SPISR);

    /** Set the register configuration*/
    uvm_config_db#(spi_uvc_reg_cfg)::set(this,"*","spi_reg_cfg_h",spi_reg_cfg_h);

    /** Creating environment config*/
    spi_sys_cfg_h = spi_uvc_system_cfg::type_id::create("spi_sys_cfg_h");
      
    /** Set the system configuration*/
    uvm_config_db#(spi_uvc_system_cfg)::set(this,"*","spi_sys_cfg_h",spi_sys_cfg_h);

    /** Creating the Environment*/
    spi_env_h = spi_uvc_env::type_id::create("spi_env_h",this);
      
    `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
  endfunction : build_phase

  /** End_of_elaboration_phase*/
  function void spi_uvc_base_test::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info(get_type_name(),"INSIDE END_OF_ELABORATION_PHASE",UVM_FULL);
     /** Printing Topology*/
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

  /** Method to take data from the command prompt*/
  function void spi_uvc_base_test::config_func(output bit[7:0] reg0,reg1,reg2,reg3);
    if($value$plusargs("spicr1=%b",reg0))begin
      `uvm_info(get_name(),"inside function config_func",UVM_LOW)
      `uvm_info(get_name(),$sformatf("reg0 value =%0d",reg0),UVM_LOW)
    end /** if*/
    
    else begin
      reg0 = 8'b0100_0000;
      `uvm_info(get_name(),"inside function config_func else part",UVM_LOW)
    end /** else*/

    if($value$plusargs("spicr2=%b",reg1)) begin
      `uvm_info(get_name(),$sformatf("reg1 value = %0d",reg1),UVM_LOW)
    end /** if*/
     
    else begin
      reg1 = 8'b0000_0000;
      `uvm_info(get_name(),$sformatf("reg1 value = %0d",reg1),UVM_LOW)
    end /** else*/

    if($value$plusargs("spibr=%b",reg2))begin
      `uvm_info(get_name(),$sformatf("reg2 value =%0d",reg2),UVM_LOW)
    end /** if*/

    else begin
      reg2 = 8'b0000_0000;
      `uvm_info(get_name(),$sformatf("reg2 value =%0d",reg2),UVM_LOW)
    end /** else*/
    
    if($value$plusargs("spisr=%b",reg3)) begin
      `uvm_info(get_name(),$sformatf("reg3 value = %0d",reg3),UVM_LOW)
    end /** if*/

    else begin
      reg1 = 8'b0010_0000;
      `uvm_info(get_name(),$sformatf("reg3 value = %0d",reg3),UVM_LOW)
    end /** else*/
  endfunction : config_func