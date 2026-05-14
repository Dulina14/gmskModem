//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CONVENCODER_SEQ_CONFIG__SV                        
    `define CONVENCODER_SEQ_CONFIG__SV                    
                                                            
    class convEncoder_Seq_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_s_axis_cfg;
        svr_pkg::svr_config port_m_axis_cfg;

        `uvm_object_utils_begin(convEncoder_Seq_config)         
        `uvm_field_object(port_s_axis_cfg, UVM_DEFAULT)
        `uvm_field_object(port_m_axis_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "convEncoder_Seq_config");
            super.new(name);                                
            port_s_axis_cfg = svr_pkg::svr_config::type_id::create("port_s_axis_cfg");
            port_m_axis_cfg = svr_pkg::svr_config::type_id::create("port_m_axis_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
