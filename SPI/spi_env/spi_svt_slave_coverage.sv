////////////////////////////////////////////////
// File:          spi_svt_slave_coverage.sv
// Version:       v1
// Developer:     Mayank
// Project Name:  
// Discription:    
/////////////////////////////////////////////////

//
// Class Description:
//
//
`ifndef SPI_SVT_SLAVE_COVERAGE_SV
`define SPI_SVT_SLAVE_COVERAGE_SV
class spi_svt_slave_coverage extends uvm_subscriber#(spi_svt_trans);
   //   
   `uvm_component_utils(spi_svt_slave_coverage);

   
   //------------------------------------------
   // Methods
   //------------------------------------------

   //Standard UVM Methods: 
   //
   function new(string name = "spi_svt_slave_coverage",uvm_component parent);
      super.new(name,parent);
   endfunction : new

   //build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info(get_type_name(),"START OF BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE BUILD_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF BUILD_PHASE",UVM_HIGH);
   endfunction : build_phase

   //write method
   function void write(spi_svt_trans t);
   endfunction : write

   //extract_phase
   function void extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      `uvm_info(get_type_name(),"START OF EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"INSIDE EXTRACT_PHASE",UVM_HIGH);

      `uvm_info(get_type_name(),"END OF EXTRACT_PHASE",UVM_HIGH);
   endfunction : extract_phase

endclass
`endif //: SPI_SVT_SLAVE_COVERAGE
