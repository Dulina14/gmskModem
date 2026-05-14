// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:bd_0:1.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module bd_0_sv (
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis" *)
  (* X_INTERFACE_MODE = "master m_axis" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.master m_axis,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis" *)
  (* X_INTERFACE_MODE = "slave s_axis" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.slave s_axis,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire ap_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire ap_rst_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ap_ctrl_done,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ap_ctrl_idle,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ap_ctrl_ready,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire ap_ctrl_start
);

  // interface wire assignments
  assign m_axis.TDEST = 0;
  assign m_axis.TID = 0;
  assign m_axis.TUSER = 0;

  bd_0 inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_ctrl_done(ap_ctrl_done),
    .ap_ctrl_idle(ap_ctrl_idle),
    .ap_ctrl_ready(ap_ctrl_ready),
    .ap_ctrl_start(ap_ctrl_start),
    .m_axis_tdata(m_axis.TDATA),
    .m_axis_tkeep(m_axis.TKEEP),
    .m_axis_tlast(m_axis.TLAST),
    .m_axis_tready(m_axis.TREADY),
    .m_axis_tstrb(m_axis.TSTRB),
    .m_axis_tvalid(m_axis.TVALID),
    .s_axis_tdata(s_axis.TDATA),
    .s_axis_tkeep(s_axis.TKEEP),
    .s_axis_tlast(s_axis.TLAST),
    .s_axis_tready(s_axis.TREADY),
    .s_axis_tstrb(s_axis.TSTRB),
    .s_axis_tvalid(s_axis.TVALID)
  );

endmodule
