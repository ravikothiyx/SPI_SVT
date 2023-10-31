////////////////////////////////////////////////
// File:          spi_uvc_top.sv
// Version:       v1
// Developer:     
// Project Name:  SPI
// Discription:   
/////////////////////////////////////////////////

`uvm_analysis_imp_decl(_mstr)
`uvm_analysis_imp_decl(_slv)


/** class declaration for spi scoreboard */
class spi_uvc_sb extends uvm_scoreboard;

 /** handles for analysis implication ports */
 uvm_analysis_imp_mstr #(spi_uvc_transaction,spi_uvc_sb) spi_mstr_mon_sb;
 uvm_analysis_imp_slv #(spi_uvc_transaction,spi_uvc_sb) spi_slv_mon_sb;

 /** handles for actual data transaction and expexted data transactions */
 spi_uvc_transaction act_spi_uvc_trans_h;
 spi_uvc_transaction exp_spi_uvc_trans_h;
 
 /** queues for inorder scoreboard data comparision */
 spi_uvc_transaction act_slv_data[$];
 spi_uvc_transaction exp_mstr_data[$];
 
 /** reference memory */                                               
 bit [`DATA_WIDTH -1 :0] ref_mem [int];

 /** To index the data inside both queues*/
 int i;

 /**  Count for passed transactions*/
 int pass_count;

 /** Count for fail transactions*/
 int fail_count;

 /** factory registration */ 
 `uvm_component_utils_begin(spi_uvc_sb)
   `uvm_field_aa_int_int(ref_mem,UVM_ALL_ON)
 `uvm_component_utils_end

 /** function new */
 function new(string name = "spi_uvc_sb",uvm_component parent = null);
  super.new(name,parent);
  spi_mstr_mon_sb=new("spi_mstr_mon_sb",this);
  spi_slv_mon_sb=new("spi_slv_mon_sb",this);
 endfunction

 function void build_phase(uvm_phase phase);
  super.build_phase(phase);
 endfunction : build_phase 

 /** write method for slave */
 function void write_slv(spi_uvc_transaction exp_mstr_trans_h);
    `uvm_info(get_name(),$sformatf("\n%s",exp_mstr_trans_h.sprint()),UVM_LOW); 
  case(exp_mstr_trans_h.header[7])

          
   1'b1 : begin 
           ref_mem[exp_mstr_trans_h.header[`ADDR_WIDTH-2 : 0]] = exp_mstr_trans_h.wr_data;
          // `uvm_info(get_name(),$sformatf("\n%s",sprint()),UVM_LOW); 
          end
   1'b0 : begin
           exp_spi_uvc_trans_h=spi_uvc_transaction::type_id::create("exp_spi_uvc_trans_h",this);
           if(ref_mem.exists(exp_mstr_trans_h.header[`ADDR_WIDTH-2 : 0]))begin
            exp_spi_uvc_trans_h.rd_data = ref_mem[exp_mstr_trans_h.header[`ADDR_WIDTH-2 : 0]];
            exp_mstr_data.push_back(exp_spi_uvc_trans_h);
           end
           else begin
            exp_spi_uvc_trans_h.rd_data = 'h0;
            exp_mstr_data.push_back(exp_spi_uvc_trans_h);
            //`uvm_info(get_name(),$sformatf("\n%s",sprint()),UVM_LOW); 
           end
          end
   endcase

 endfunction

 function void write_mstr(spi_uvc_transaction act_slv_trans_h);
    `uvm_info(get_name(),$sformatf("\n%s",act_slv_trans_h.sprint()),UVM_LOW); 
    act_slv_data.push_back(act_slv_trans_h);
    check_data(exp_mstr_data,act_slv_data);
 endfunction

 function void check_data(spi_uvc_transaction exp_mstr_data[$], spi_uvc_transaction act_slv_data[$]);
  if(exp_mstr_data.size() > 0 && act_slv_data.size() > 0) begin
   if(exp_mstr_data[i].rd_data == act_slv_data[i].rd_data) begin
    if(!`SB_PASS_COUNT)begin
    `uvm_info(get_name(),"==================SUCCESS=================",UVM_LOW);
    `uvm_info(get_name(),$sformatf("act_slv_data : %0p, exp_mstr_data : %0p",act_slv_data[i].rd_data,exp_mstr_data[i].rd_data),UVM_LOW)
    end /** if*/
    pass_count++;
    exp_mstr_data.delete();
    act_slv_data.delete();
    i++;
   end
   else begin
    if(!`SB_PASS_COUNT)begin
    `uvm_info(get_name(),"==================FAILURE=================",UVM_LOW);
    `uvm_info(get_name(),$sformatf("act_slv_data : %0p, exp_mstr_data : %0p",act_slv_data[i].rd_data,exp_mstr_data[i].rd_data),UVM_LOW)
    end /** else*/
    fail_count++;
    i++;
   end
  end
 endfunction

   /** Extract_phase*/
   function void extract_phase(uvm_phase phase);
      super.extract_phase(phase);
      //as per the macro printing the pass count
      if(`SB_PASS_COUNT)begin
         `uvm_info(get_type_name(),$sformatf(" \n\tPASSED || NUMBER OF PASSED B2B WRITE AND READ TRANSACTIONS = %0d\n",pass_count),UVM_NONE);
      end
   endfunction : extract_phase
endclass
