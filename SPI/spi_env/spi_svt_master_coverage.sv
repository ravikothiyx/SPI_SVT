////////////////////////////////////////////////
// File:          spi_svt_master_coverage.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  APB3 Protocol
// Discription:   APB subscriber file 
/////////////////////////////////////////////////

//
// Class Description:
//
//
`ifndef SPI_SVT_MASTER_COVERAGE_SV
`define SPI_SVT_MASTER_COVERAGE_SV
class spi_svt_master_coverage extends uvm_subscriber;
   // UVM Factory Registration Macro
   //   
   `uvm_component_utils(spi_svt_master_coverage);

   
   //------------------------------------------
   // Methods
   //------------------------------------------

   //Standard UVM Methods: 
   //
   function new(string name = "spi_svt_master_coverage",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   //extract_phase
   function void extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase

endclass
`endif //: SPI_SVT_MASTER_COVERAGE
