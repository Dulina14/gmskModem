//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CONVENCODER_SEQ_SCOREBOARD__SV                                                       
    `define CONVENCODER_SEQ_SCOREBOARD__SV                                                   
                                                                                               
    `define AUTOTB_TVOUT_m_axis_m_axis_TDATA_wrapc  "../tv/rtldatafile/rtl.convEncoder_Seq.autotvout_m_axis_V_data_V.dat"
    `define AUTOTB_TVOUT_m_axis_m_axis_TKEEP_wrapc  "../tv/rtldatafile/rtl.convEncoder_Seq.autotvout_m_axis_V_keep_V.dat"
    `define AUTOTB_TVOUT_m_axis_m_axis_TSTRB_wrapc  "../tv/rtldatafile/rtl.convEncoder_Seq.autotvout_m_axis_V_strb_V.dat"
    `define AUTOTB_TVOUT_m_axis_m_axis_TLAST_wrapc  "../tv/rtldatafile/rtl.convEncoder_Seq.autotvout_m_axis_V_last_V.dat"
    `define STREAM_SIZE_OUT_m_axis_m_axis_TDATA  "../tv/stream_size/stream_size_out_m_axis_V_data_V.dat"
    `define STREAM_SIZE_OUT_m_axis_m_axis_TKEEP  "../tv/stream_size/stream_size_out_m_axis_V_keep_V.dat"
    `define STREAM_SIZE_OUT_m_axis_m_axis_TSTRB  "../tv/stream_size/stream_size_out_m_axis_V_strb_V.dat"
    `define STREAM_SIZE_OUT_m_axis_m_axis_TLAST  "../tv/stream_size/stream_size_out_m_axis_V_last_V.dat"
                                                                                               
    class convEncoder_Seq_scoreboard extends uvm_component;                                        
                                                                                               
        convEncoder_Seq_reference_model refm;                                                      
                                                                                               
        typedef integer TRANS_SIZE_QUEUE_TYPE [$];                                      
        TRANS_SIZE_QUEUE_TYPE TVOUT_transaction_size_queue;                                
        int write_file_done_m_axis_m_axis_TDATA;                                                          
        int write_file_done_m_axis_m_axis_TKEEP;                                                          
        int write_file_done_m_axis_m_axis_TSTRB;                                                          
        int write_file_done_m_axis_m_axis_TLAST;                                                          
        int write_section_done_m_axis_m_axis_TDATA = 0;                                                   
        int write_section_done_m_axis_m_axis_TKEEP = 0;                                                   
        int write_section_done_m_axis_m_axis_TSTRB = 0;                                                   
        int write_section_done_m_axis_m_axis_TLAST = 0;                                                   
                                                                                           
        file_agent_pkg::file_read_agent#(32) file_rd_TVOUT_transaction_size;               
                                                                                           
        file_agent_pkg::file_write_agent#(32) file_wr_port_m_axis_m_axis_TDATA;
        file_agent_pkg::file_write_agent#(4) file_wr_port_m_axis_m_axis_TKEEP;
        file_agent_pkg::file_write_agent#(4) file_wr_port_m_axis_m_axis_TSTRB;
        file_agent_pkg::file_write_agent#(1) file_wr_port_m_axis_m_axis_TLAST;
                                                                                               
        `uvm_component_utils_begin(convEncoder_Seq_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_field_object(file_rd_TVOUT_transaction_size, UVM_DEFAULT)
        `uvm_field_queue_int(TVOUT_transaction_size_queue, UVM_DEFAULT)                    
        `uvm_field_object(file_wr_port_m_axis_m_axis_TDATA, UVM_DEFAULT)
        `uvm_field_int(write_file_done_m_axis_m_axis_TDATA, UVM_DEFAULT)
        `uvm_field_int(write_section_done_m_axis_m_axis_TDATA, UVM_DEFAULT)
        `uvm_field_object(file_wr_port_m_axis_m_axis_TKEEP, UVM_DEFAULT)
        `uvm_field_int(write_file_done_m_axis_m_axis_TKEEP, UVM_DEFAULT)
        `uvm_field_int(write_section_done_m_axis_m_axis_TKEEP, UVM_DEFAULT)
        `uvm_field_object(file_wr_port_m_axis_m_axis_TSTRB, UVM_DEFAULT)
        `uvm_field_int(write_file_done_m_axis_m_axis_TSTRB, UVM_DEFAULT)
        `uvm_field_int(write_section_done_m_axis_m_axis_TSTRB, UVM_DEFAULT)
        `uvm_field_object(file_wr_port_m_axis_m_axis_TLAST, UVM_DEFAULT)
        `uvm_field_int(write_file_done_m_axis_m_axis_TLAST, UVM_DEFAULT)
        `uvm_field_int(write_section_done_m_axis_m_axis_TLAST, UVM_DEFAULT)
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(convEncoder_Seq_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
            file_rd_TVOUT_transaction_size = file_agent_pkg::file_read_agent#(32)::type_id::create("file_rd_TVOUT_transaction_size", this);
                                                                                               
            file_wr_port_m_axis_m_axis_TDATA = file_agent_pkg::file_write_agent#(32)::type_id::create("file_wr_port_m_axis_m_axis_TDATA", this);
            file_wr_port_m_axis_m_axis_TKEEP = file_agent_pkg::file_write_agent#(4)::type_id::create("file_wr_port_m_axis_m_axis_TKEEP", this);
            file_wr_port_m_axis_m_axis_TSTRB = file_agent_pkg::file_write_agent#(4)::type_id::create("file_wr_port_m_axis_m_axis_TSTRB", this);
            file_wr_port_m_axis_m_axis_TLAST = file_agent_pkg::file_write_agent#(1)::type_id::create("file_wr_port_m_axis_m_axis_TLAST", this);
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
            write_file_done_m_axis_m_axis_TDATA = 0;                                                          
            write_file_done_m_axis_m_axis_TKEEP = 0;                                                          
            write_file_done_m_axis_m_axis_TSTRB = 0;                                                          
            write_file_done_m_axis_m_axis_TLAST = 0;                                                          
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               
            create_TVOUT_transaction_size_queue_by_file(`STREAM_SIZE_OUT_m_axis_m_axis_TDATA);
            file_wr_port_m_axis_m_axis_TDATA.config_file(   
                    `AUTOTB_TVOUT_m_axis_m_axis_TDATA_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            
            create_TVOUT_transaction_size_queue_by_file(`STREAM_SIZE_OUT_m_axis_m_axis_TKEEP);
            file_wr_port_m_axis_m_axis_TKEEP.config_file(   
                    `AUTOTB_TVOUT_m_axis_m_axis_TKEEP_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            
            create_TVOUT_transaction_size_queue_by_file(`STREAM_SIZE_OUT_m_axis_m_axis_TSTRB);
            file_wr_port_m_axis_m_axis_TSTRB.config_file(   
                    `AUTOTB_TVOUT_m_axis_m_axis_TSTRB_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            
            create_TVOUT_transaction_size_queue_by_file(`STREAM_SIZE_OUT_m_axis_m_axis_TLAST);
            file_wr_port_m_axis_m_axis_TLAST.config_file(   
                    `AUTOTB_TVOUT_m_axis_m_axis_TLAST_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            

            fork                                                                               
                                                                                               
                forever begin
                    @refm.dut2tb_ap_done;
                    `uvm_info(this.get_full_name(), "receive dut2tb_ap_done and do axim dump", UVM_LOW)
                    file_wr_port_m_axis_m_axis_TDATA.receive_ap_done();
                    file_wr_port_m_axis_m_axis_TKEEP.receive_ap_done();
                    file_wr_port_m_axis_m_axis_TSTRB.receive_ap_done();
                    file_wr_port_m_axis_m_axis_TLAST.receive_ap_done();
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                    file_wr_port_m_axis_m_axis_TDATA.wait_write_file_done();
                    file_wr_port_m_axis_m_axis_TKEEP.wait_write_file_done();
                    file_wr_port_m_axis_m_axis_TSTRB.wait_write_file_done();
                    file_wr_port_m_axis_m_axis_TLAST.wait_write_file_done();
                end                                                                            
                begin                                                                      
                    forever begin                                                              
                        wait(write_section_done_m_axis_m_axis_TDATA && write_section_done_m_axis_m_axis_TKEEP && write_section_done_m_axis_m_axis_TSTRB && write_section_done_m_axis_m_axis_TLAST);                          
                        write_section_done_m_axis_m_axis_TDATA = 0;                                               
                        write_section_done_m_axis_m_axis_TKEEP = 0;                                               
                        write_section_done_m_axis_m_axis_TSTRB = 0;                                               
                        write_section_done_m_axis_m_axis_TLAST = 0;                                               
                        -> refm.allsvr_output_done;                                         
                    end                                                                        
                end                                                                        
            join                                                                               
        endtask                                                                                
                                                                                               
         virtual function void create_TVOUT_transaction_size_queue_by_file(string TVOUT_file); 
             typedef bit [31: 0] DATA_QUEUE_TYPE [$];                                     
             DATA_QUEUE_TYPE TV_Queue [$];                                                  
             DATA_QUEUE_TYPE TV;                                                               
             string file_queue [$];                                                         
             integer bitwidth_queue [$];                                                    
             file_queue.push_back(TVOUT_file);                                                 
             bitwidth_queue.push_back(32);                                                     
                                                                                               
             file_rd_TVOUT_transaction_size.config_file(                                       
                 file_queue,                                                                   
                 bitwidth_queue                                                                
             );                                                                                
                                                                                               
             file_rd_TVOUT_transaction_size.read_TVIN_file();                                  
                                                                                               
             TV_Queue = file_rd_TVOUT_transaction_size.TV_Queue;                               
             TVOUT_transaction_size_queue.delete();                                            
             while (TV_Queue.size() > 0) begin                                                 
                 TV = TV_Queue.pop_front();                                                    
                 if (TV.size() != 1)                                                           
                         `uvm_fatal(this.get_full_name(), $sformatf("number of each transaction size should be 1, read %0d in file %0s   ", TV.size(), TVOUT_file))
                 `uvm_info(this.get_full_name(), $sformatf("get transaction size %0d", TV[0]), UVM_MEDIUM)
                 TVOUT_transaction_size_queue.push_back(TV.pop_front());                       
             end                                                                               
         endfunction                                                                           
                                                                                               
        virtual function void write_svr_master_s_axis(svr_transfer#(41) tr);
            `uvm_info(this.get_full_name(), "port s_axis collected one pkt", UVM_DEBUG);          
        endfunction
                   
        virtual function void write_svr_slave_m_axis(svr_transfer#(41) tr);
            `uvm_info(this.get_full_name(), "port m_axis collected one pkt", UVM_DEBUG);          
            file_wr_port_m_axis_m_axis_TDATA.write_TVOUT_data(tr.data[31: 0]);
            write_file_done_m_axis_m_axis_TDATA = file_wr_port_m_axis_m_axis_TDATA.is_write_file_done();
            write_section_done_m_axis_m_axis_TDATA = file_wr_port_m_axis_m_axis_TDATA.is_write_section_done();
            if(write_section_done_m_axis_m_axis_TDATA) 
                `uvm_info("m_axis rx data done", "signal name:m_axis_TDATA", UVM_MEDIUM)
            file_wr_port_m_axis_m_axis_TKEEP.write_TVOUT_data(tr.data[35: 32]);
            write_file_done_m_axis_m_axis_TKEEP = file_wr_port_m_axis_m_axis_TKEEP.is_write_file_done();
            write_section_done_m_axis_m_axis_TKEEP = file_wr_port_m_axis_m_axis_TKEEP.is_write_section_done();
            if(write_section_done_m_axis_m_axis_TKEEP) 
                `uvm_info("m_axis rx data done", "signal name:m_axis_TKEEP", UVM_MEDIUM)
            file_wr_port_m_axis_m_axis_TSTRB.write_TVOUT_data(tr.data[39: 36]);
            write_file_done_m_axis_m_axis_TSTRB = file_wr_port_m_axis_m_axis_TSTRB.is_write_file_done();
            write_section_done_m_axis_m_axis_TSTRB = file_wr_port_m_axis_m_axis_TSTRB.is_write_section_done();
            if(write_section_done_m_axis_m_axis_TSTRB) 
                `uvm_info("m_axis rx data done", "signal name:m_axis_TSTRB", UVM_MEDIUM)
            file_wr_port_m_axis_m_axis_TLAST.write_TVOUT_data(tr.data[40: 40]);
            write_file_done_m_axis_m_axis_TLAST = file_wr_port_m_axis_m_axis_TLAST.is_write_file_done();
            write_section_done_m_axis_m_axis_TLAST = file_wr_port_m_axis_m_axis_TLAST.is_write_section_done();
            if(write_section_done_m_axis_m_axis_TLAST) 
                `uvm_info("m_axis rx data done", "signal name:m_axis_TLAST", UVM_MEDIUM)
        endfunction
                   
    endclass                                                                                   
                                                                                               
`endif                                                                                         
