////////////////////////////////////////////////
// File:          spi_uvc_coverage.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////


`ifndef SPI_UVC_COVERAGE_SV
`define SPI_UVC_COVERAGE_SV
class spi_uvc_coverage extends uvm_subscriber#(spi_uvc_trans);

   /** UVM Factory Registration Macro*/
   `uvm_component_utils(spi_uvc_coverage);
   
   /** Standard UVM Methods*/
   extern function new(string name = "spi_uvc_coverage",uvm_component parent);

   /** Build_phase*/
   extern function void build_phase(uvm_phase phase);

   /** Write method*/
   extern function void write(spi_uvc_trans t);

   /** Extract_phase*/
   extern function void extract_phase(uvm_phase phase);

endclass
`endif //: SPI_UVC_COVERAGE

   /** Standard UVM Methods*/
   function spi_uvc_coverage::new(string name = "spi_uvc_coverage",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   /** Build_phase*/
   function void spi_uvc_coverage::build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   /** Write method*/
   function void spi_uvc_coverage::write(spi_uvc_trans t);
   endfunction : write

   /** Extract_phase*/
   function void spi_uvc_coverage::extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);
      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase
