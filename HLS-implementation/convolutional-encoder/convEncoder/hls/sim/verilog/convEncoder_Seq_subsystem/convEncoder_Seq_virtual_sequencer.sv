//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CONVENCODER_SEQ_VIRTUAL_SEQUENCER__SV                        
    `define CONVENCODER_SEQ_VIRTUAL_SEQUENCER__SV                    
                                                                       
    class convEncoder_Seq_virtual_sequencer extends uvm_sequencer;         
        svr_master_sequencer#(41) svr_port_s_axis_sqr;
        svr_slave_sequencer#(41) svr_port_m_axis_sqr;
 
        function new (string name, uvm_component parent);              
            super.new(name, parent);                                   
            //`uvm_info(this.get_full_name(), "new is called", UVM_LOW)
        endfunction                                                    
                                                                       
        `uvm_component_utils_begin(convEncoder_Seq_virtual_sequencer)      
        `uvm_component_utils_end                                       
                                                                       
    endclass

`endif
