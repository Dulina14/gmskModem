//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import convEncoder_Seq_subsystem_pkg::*;
`include "convEncoder_Seq_subsys_test_sequence_lib.sv"
`include "convEncoder_Seq_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_convEncoder_Seq_top.AESL_clock), .reset(apatb_convEncoder_Seq_top.AESL_reset) );
    assign apatb_convEncoder_Seq_top.ap_start = misc_if.tb2dut_ap_start;
    assign misc_if.dut2tb_ap_done = apatb_convEncoder_Seq_top.ap_done;
    assign misc_if.dut2tb_ap_ready = apatb_convEncoder_Seq_top.ap_ready;
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(41)  svr_s_axis_if    (.clk  (apatb_convEncoder_Seq_top.AESL_clock), .rst(apatb_convEncoder_Seq_top.AESL_reset));
    assign svr_s_axis_if.ready = apatb_convEncoder_Seq_top.s_axis_TREADY;
    assign apatb_convEncoder_Seq_top.s_axis_TVALID = svr_s_axis_if.valid;
    assign apatb_convEncoder_Seq_top.s_axis_TDATA = svr_s_axis_if.data[31:0];
    assign apatb_convEncoder_Seq_top.s_axis_TKEEP = svr_s_axis_if.data[35:32];
    assign apatb_convEncoder_Seq_top.s_axis_TSTRB = svr_s_axis_if.data[39:36];
    assign apatb_convEncoder_Seq_top.s_axis_TLAST = svr_s_axis_if.data[40:40];
    initial begin
        uvm_config_db #( virtual svr_if#(41) )::set(null, "uvm_test_top.top_env.env_master_svr_s_axis.*", "vif", svr_s_axis_if);
    end


    svr_if #(41)  svr_m_axis_if    (.clk  (apatb_convEncoder_Seq_top.AESL_clock), .rst(apatb_convEncoder_Seq_top.AESL_reset));
    assign apatb_convEncoder_Seq_top.m_axis_TREADY = svr_m_axis_if.ready;
    assign svr_m_axis_if.valid = apatb_convEncoder_Seq_top.m_axis_TVALID;
    assign svr_m_axis_if.data[31:0] = apatb_convEncoder_Seq_top.m_axis_TDATA;
    assign svr_m_axis_if.data[35:32] = apatb_convEncoder_Seq_top.m_axis_TKEEP;
    assign svr_m_axis_if.data[39:36] = apatb_convEncoder_Seq_top.m_axis_TSTRB;
    assign svr_m_axis_if.data[40:40] = apatb_convEncoder_Seq_top.m_axis_TLAST;
    initial begin
        uvm_config_db #( virtual svr_if#(41) )::set(null, "uvm_test_top.top_env.env_slave_svr_m_axis.*", "vif", svr_m_axis_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
