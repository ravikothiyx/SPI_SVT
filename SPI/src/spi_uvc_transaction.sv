//////////////////////////////////////////////// 
// Company:       SCALEDGE
// File:          spi_uvc_transaction.sv
// Version:       1.0
// Developer:     Harekrishna
// Project Name:  SPI
// Discription:
/////////////////////////////////////////////////


`ifndef SPI_UVC_TRANSACTION_SV
`define SPI_UVC_TRANSACTION_SV

/** Transaction type*/
typedef enum bit[1:0] {TX_ONLY,RX_ONLY ,EEPROM,FULL_DUPLEX} trans_kind;

/** SPI modes of transmission*/
typedef enum bit[1:0] {MODE_00,MODE_01,MODE_10,MODE_11}MODE;

/** MSB LSB first data trasfer*/
typedef enum bit{LSB_FIRST,MSB_FIRST}ENDIAN;

/** Mode of operation as master or slave*/
typedef enum bit{MASTER_MODE,SLAVE_MODE}MSTR_MODE;

class spi_uvc_transaction extends uvm_sequence_item;
  rand trans_kind trans_kind_e;
  
  rand MODE mode_h;
  rand ENDIAN lsb_msb_h;
  rand MSTR_MODE mstr_mode_h;
   /** SPI CONTROL REGISTER 1*/
  //rand  bit [7:0] SPICR1_h;  


  /** SPI CONTROL REGISTER 2*/
  //rand bit [7:0] SPICR2_h;  
  
  /** SPI BAUD RATE REGISTER 1*/
  rand bit [7:0] SPIBR_h;  

  /** SPI STATUS REGISTER 1*/
  //rand bit [7:0] SPISR_h;  
  

  /** For eeprom address and For normal transaction 7 bit address and 1 bit wr/rd operation*/
  rand bit [`ADDR_WIDTH - 1 : 0] header; 

  rand bit [`DATA_WIDTH - 1 : 0] wr_data;
  rand bit [`DATA_WIDTH - 1 : 0] rd_data;

  /** Only for eeprom wr/rd operation and wr/rd enable
   * READ  : 0000_0011
   * WRITE : 0000_0010
   * WREN  : 0000_0110
   * WRDI  : 0000_0100
  **/
  rand bit [`ADDR_WIDTH - 1 : 0] instruction_set; 

   `uvm_object_utils_begin(spi_uvc_transaction)
    `uvm_field_int(header          ,UVM_ALL_ON|UVM_HEX)
    `uvm_field_int(wr_data         ,UVM_ALL_ON|UVM_HEX)
    `uvm_field_int(rd_data         ,UVM_ALL_ON|UVM_HEX)
    `uvm_field_int(instruction_set ,UVM_ALL_ON|UVM_HEX)
   `uvm_object_utils_end

  /** Standard UVM Methods*/
  extern function new(string name = "spi_uvc_transaction");

endclass :spi_uvc_transaction
`endif /**SPI_UVC_TRANSACTION_SV*/
  
 function spi_uvc_transaction::new(string name = "spi_uvc_transaction");
    super.new(name);
     `uvm_info(get_full_name(),"TRANSACTION_CLASS_STARTED",UVM_LOW);
  endfunction : new


