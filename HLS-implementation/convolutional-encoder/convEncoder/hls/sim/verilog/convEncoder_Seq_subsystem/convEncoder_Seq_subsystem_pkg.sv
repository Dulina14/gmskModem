//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef CONVENCODER_SEQ_SUBSYSTEM_PKG__SV          
    `define CONVENCODER_SEQ_SUBSYSTEM_PKG__SV      
                                                     
    package convEncoder_Seq_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "convEncoder_Seq_config.sv"           
        `include "convEncoder_Seq_reference_model.sv"  
        `include "convEncoder_Seq_scoreboard.sv"       
        `include "convEncoder_Seq_subsystem_monitor.sv"
        `include "convEncoder_Seq_virtual_sequencer.sv"
        `include "convEncoder_Seq_pkg_sequence_lib.sv" 
        `include "convEncoder_Seq_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
