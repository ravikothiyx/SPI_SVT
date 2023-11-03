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

   extern function void config_func(output bit[7:0] reg0,reg1,reg2,reg3);

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

      config_func(reg_cfg_h.SPICR1,reg_cfg_h.SPICR2,reg_cfg_h.SPIBR,reg_cfg_h.SPISR);

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

   /** reg_func */
   function void spi_uvc_base_test::config_func(output bit[7:0] reg0,reg1,reg2,reg3);
     if($value$plusargs("spicr1=%b",reg0))begin
     `uvm_info(get_name(),"inside function config_func",UVM_LOW)
     `uvm_info(get_name(),$sformatf("reg0 value =%0d",reg0),UVM_LOW)
     end
     else begin
        reg0 = 8'b0100_0000;
        `uvm_info(get_name(),"inside function config_func else part",UVM_LOW)
     end
     if($value$plusargs("spicr2=%b",reg1)) begin
      `uvm_info(get_name(),$sformatf("reg1 value = %0d",reg1),UVM_LOW)
     end
     else begin
      reg1 = 8'b0000_0000;
      `uvm_info(get_name(),$sformatf("reg1 value = %0d",reg1),UVM_LOW)
     end
     if($value$plusargs("spibr=%b",reg2))begin
     `uvm_info(get_name(),$sformatf("reg2 value =%0d",reg2),UVM_LOW)
     end
     else begin
        reg2 = 8'b0000_0000;
        `uvm_info(get_name(),$sformatf("reg2 value =%0d",reg2),UVM_LOW)
     end
     if($value$plusargs("spisr=%b",reg3)) begin
      `uvm_info(get_name(),$sformatf("reg3 value = %0d",reg3),UVM_LOW)
     end
     else begin
      reg1 = 8'b0010_0000;
      `uvm_info(get_name(),$sformatf("reg3 value = %0d",reg3),UVM_LOW)
     end
   endfunction
   
