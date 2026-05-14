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

// The following must be inserted into your Verilog file for this
// module to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

// INST_TAG     ------ Begin cut for INSTANTIATION Template ------
bd_0 your_instance_name (
  .ap_clk(ap_clk), // input wire ap_clk
  .ap_rst_n(ap_rst_n), // input wire ap_rst_n
  .ap_ctrl_done(ap_ctrl_done), // output wire ap_ctrl_done
  .ap_ctrl_idle(ap_ctrl_idle), // output wire ap_ctrl_idle
  .ap_ctrl_ready(ap_ctrl_ready), // output wire ap_ctrl_ready
  .ap_ctrl_start(ap_ctrl_start), // input wire ap_ctrl_start
  .m_axis_tdata(m_axis_tdata), // output wire [31:0] m_axis_tdata
  .m_axis_tkeep(m_axis_tkeep), // output wire [3:0] m_axis_tkeep
  .m_axis_tlast(m_axis_tlast), // output wire [0:0] m_axis_tlast
  .m_axis_tready(m_axis_tready), // input wire m_axis_tready
  .m_axis_tstrb(m_axis_tstrb), // output wire [3:0] m_axis_tstrb
  .m_axis_tvalid(m_axis_tvalid), // output wire m_axis_tvalid
  .s_axis_tdata(s_axis_tdata), // input wire [31:0] s_axis_tdata
  .s_axis_tkeep(s_axis_tkeep), // input wire [3:0] s_axis_tkeep
  .s_axis_tlast(s_axis_tlast), // input wire [0:0] s_axis_tlast
  .s_axis_tready(s_axis_tready), // output wire s_axis_tready
  .s_axis_tstrb(s_axis_tstrb), // input wire [3:0] s_axis_tstrb
  .s_axis_tvalid(s_axis_tvalid) // input wire s_axis_tvalid
);
// INST_TAG_END ------  End cut for INSTANTIATION Template  ------

// You must compile the wrapper file bd_0.v when simulating
// the module, bd_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.
