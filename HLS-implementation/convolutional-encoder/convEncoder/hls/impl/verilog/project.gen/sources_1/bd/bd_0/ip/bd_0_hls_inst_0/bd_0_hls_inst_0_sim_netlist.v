// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Mar 18 16:08:39 2026
// Host        : Dulina running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vitis_HLS/gmskModem/convEncoder/convEncoder/hls/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.v
// Design      : bd_0_hls_inst_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,convEncoder_Seq,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "convEncoder_Seq,Vivado 2025.2" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module bd_0_hls_inst_0
   (ap_clk,
    ap_rst_n,
    ap_done,
    ap_idle,
    ap_ready,
    ap_start,
    s_axis_TDATA,
    s_axis_TKEEP,
    s_axis_TLAST,
    s_axis_TREADY,
    s_axis_TSTRB,
    s_axis_TVALID,
    m_axis_TDATA,
    m_axis_TKEEP,
    m_axis_TLAST,
    m_axis_TREADY,
    m_axis_TSTRB,
    m_axis_TVALID);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axis:m_axis, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) (* X_INTERFACE_MODE = "slave" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *) input [3:0]s_axis_TKEEP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) input [0:0]s_axis_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TSTRB" *) input [3:0]s_axis_TSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *) output [3:0]m_axis_TKEEP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output [0:0]m_axis_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TSTRB" *) output [3:0]m_axis_TSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_TVALID;

  wire \<const1> ;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [31:0]m_axis_TDATA;
  wire [0:0]m_axis_TLAST;
  wire m_axis_TREADY;
  wire m_axis_TVALID;
  wire [31:0]s_axis_TDATA;
  wire [0:0]s_axis_TLAST;
  wire s_axis_TREADY;
  wire s_axis_TVALID;
  wire [3:0]NLW_inst_m_axis_TKEEP_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_TSTRB_UNCONNECTED;

  assign m_axis_TKEEP[3] = \<const1> ;
  assign m_axis_TKEEP[2] = \<const1> ;
  assign m_axis_TKEEP[1] = \<const1> ;
  assign m_axis_TKEEP[0] = \<const1> ;
  assign m_axis_TSTRB[3] = \<const1> ;
  assign m_axis_TSTRB[2] = \<const1> ;
  assign m_axis_TSTRB[1] = \<const1> ;
  assign m_axis_TSTRB[0] = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "4'b0001" *) 
  (* ap_ST_fsm_state2 = "4'b0010" *) 
  (* ap_ST_fsm_state3 = "4'b0100" *) 
  (* ap_ST_fsm_state4 = "4'b1000" *) 
  bd_0_hls_inst_0_convEncoder_Seq inst
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .m_axis_TDATA(m_axis_TDATA),
        .m_axis_TKEEP(NLW_inst_m_axis_TKEEP_UNCONNECTED[3:0]),
        .m_axis_TLAST(m_axis_TLAST),
        .m_axis_TREADY(m_axis_TREADY),
        .m_axis_TSTRB(NLW_inst_m_axis_TSTRB_UNCONNECTED[3:0]),
        .m_axis_TVALID(m_axis_TVALID),
        .s_axis_TDATA(s_axis_TDATA),
        .s_axis_TKEEP({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_TLAST(s_axis_TLAST),
        .s_axis_TREADY(s_axis_TREADY),
        .s_axis_TSTRB({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_TVALID(s_axis_TVALID));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "convEncoder_Seq" *) (* ap_ST_fsm_state1 = "4'b0001" *) 
(* ap_ST_fsm_state2 = "4'b0010" *) (* ap_ST_fsm_state3 = "4'b0100" *) (* ap_ST_fsm_state4 = "4'b1000" *) 
(* hls_module = "yes" *) 
module bd_0_hls_inst_0_convEncoder_Seq
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    s_axis_TDATA,
    s_axis_TVALID,
    s_axis_TREADY,
    s_axis_TKEEP,
    s_axis_TSTRB,
    s_axis_TLAST,
    m_axis_TDATA,
    m_axis_TVALID,
    m_axis_TREADY,
    m_axis_TKEEP,
    m_axis_TSTRB,
    m_axis_TLAST);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]s_axis_TDATA;
  input s_axis_TVALID;
  output s_axis_TREADY;
  input [3:0]s_axis_TKEEP;
  input [3:0]s_axis_TSTRB;
  input [0:0]s_axis_TLAST;
  output [31:0]m_axis_TDATA;
  output m_axis_TVALID;
  input m_axis_TREADY;
  output [3:0]m_axis_TKEEP;
  output [3:0]m_axis_TSTRB;
  output [0:0]m_axis_TLAST;

  wire \<const0> ;
  wire \ap_CS_fsm[3]_i_3_n_3 ;
  wire ap_CS_fsm_state1;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire [3:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_start;
  wire data1;
  wire data10;
  wire data11;
  wire data12;
  wire data13;
  wire data14;
  wire data15;
  wire data16;
  wire data17;
  wire data18;
  wire data19;
  wire data2;
  wire data20;
  wire data21;
  wire data22;
  wire data23;
  wire data24;
  wire data25;
  wire data26;
  wire data27;
  wire data28;
  wire data29;
  wire data3;
  wire data30;
  wire data31;
  wire data4;
  wire data5;
  wire data6;
  wire data7;
  wire data8;
  wire data9;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg;
  wire [63:32]grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77;
  wire [5:0]grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out;
  wire \in_word_data_reg_178_reg_n_3_[0] ;
  wire [0:0]in_word_last_reg_183;
  wire [31:0]m_axis_TDATA;
  wire [0:0]m_axis_TLAST;
  wire m_axis_TREADY;
  wire m_axis_TVALID;
  wire [31:0]p_s_reg_191;
  wire [31:0]s_axis_TDATA;
  wire [0:0]s_axis_TLAST;
  wire s_axis_TREADY;
  wire s_axis_TVALID;
  wire [5:0]state;
  wire state0;
  wire [0:0]tmp_reg_174;

  assign ap_done = ap_ready;
  assign m_axis_TKEEP[3] = \<const0> ;
  assign m_axis_TKEEP[2] = \<const0> ;
  assign m_axis_TKEEP[1] = \<const0> ;
  assign m_axis_TKEEP[0] = \<const0> ;
  assign m_axis_TSTRB[3] = \<const0> ;
  assign m_axis_TSTRB[2] = \<const0> ;
  assign m_axis_TSTRB[1] = \<const0> ;
  assign m_axis_TSTRB[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hD0FFD0D0)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(tmp_reg_174),
        .I1(m_axis_TREADY),
        .I2(ap_CS_fsm_state4),
        .I3(ap_start),
        .I4(ap_CS_fsm_state1),
        .O(ap_NS_fsm[0]));
  LUT6 #(
    .INIT(64'hF808F808F808FFFF)) 
    \ap_CS_fsm[3]_i_2 
       (.I0(tmp_reg_174),
        .I1(ap_CS_fsm_state4),
        .I2(m_axis_TREADY),
        .I3(ap_CS_fsm_state3),
        .I4(s_axis_TVALID),
        .I5(\ap_CS_fsm[3]_i_3_n_3 ),
        .O(ap_NS_fsm[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \ap_CS_fsm[3]_i_3 
       (.I0(ap_CS_fsm_state1),
        .I1(ap_start),
        .O(\ap_CS_fsm[3]_i_3_n_3 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(ap_CS_fsm_state1),
        .S(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_state3),
        .R(ap_rst_n_inv));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[3]),
        .Q(ap_CS_fsm_state4),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(ap_CS_fsm_state1),
        .I1(ap_start),
        .O(ap_idle));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    ap_ready_INST_0
       (.I0(ap_CS_fsm_state4),
        .I1(m_axis_TREADY),
        .I2(tmp_reg_174),
        .O(ap_ready));
  bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115
       (.D(ap_NS_fsm[2:1]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out),
        .SR(ap_rst_n_inv),
        .\ap_CS_fsm_reg[0] (grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\empty_fu_66[0]_i_4_0 ({data31,data30,data29,data28,data27,data26,data25,data24,data23,data22,data21,data20,data19,data18,data17,data16,data15,data14,data13,data12,data11,data10,data9,data8,data7,data6,data5,data4,data3,data2,data1,\in_word_data_reg_178_reg_n_3_[0] }),
        .\empty_fu_66_reg[5]_0 (grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out),
        .\empty_fu_66_reg[5]_1 (state),
        .grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .m_axis_TDATA(m_axis_TDATA),
        .\m_axis_TDATA[31] ({ap_CS_fsm_state4,ap_CS_fsm_state3,ap_CS_fsm_state2,ap_CS_fsm_state1}),
        .\m_axis_TDATA[31]_0 (p_s_reg_191),
        .m_axis_TREADY(m_axis_TREADY),
        .s_axis_TREADY(s_axis_TREADY),
        .s_axis_TVALID(s_axis_TVALID),
        .tmp_reg_174(tmp_reg_174));
  FDRE #(
    .INIT(1'b0)) 
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .R(ap_rst_n_inv));
  FDRE \in_word_data_reg_178_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[0]),
        .Q(\in_word_data_reg_178_reg_n_3_[0] ),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[10]),
        .Q(data10),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[11]),
        .Q(data11),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[12]),
        .Q(data12),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[13]),
        .Q(data13),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[14]),
        .Q(data14),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[15]),
        .Q(data15),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[16]),
        .Q(data16),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[17]),
        .Q(data17),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[18]),
        .Q(data18),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[19]),
        .Q(data19),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[1]),
        .Q(data1),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[20]),
        .Q(data20),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[21]),
        .Q(data21),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[22]),
        .Q(data22),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[23]),
        .Q(data23),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[24]),
        .Q(data24),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[25]),
        .Q(data25),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[26]),
        .Q(data26),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[27]),
        .Q(data27),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[28]),
        .Q(data28),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[29]),
        .Q(data29),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[2]),
        .Q(data2),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[30]),
        .Q(data30),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[31]),
        .Q(data31),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[3]),
        .Q(data3),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[4]),
        .Q(data4),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[5]),
        .Q(data5),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[6]),
        .Q(data6),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[7]),
        .Q(data7),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[8]),
        .Q(data8),
        .R(1'b0));
  FDRE \in_word_data_reg_178_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TDATA[9]),
        .Q(data9),
        .R(1'b0));
  FDRE \in_word_last_reg_183_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TLAST),
        .Q(in_word_last_reg_183),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \m_axis_TLAST[0]_INST_0 
       (.I0(in_word_last_reg_183),
        .I1(ap_CS_fsm_state4),
        .I2(m_axis_TREADY),
        .I3(tmp_reg_174),
        .O(m_axis_TLAST));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF800)) 
    m_axis_TVALID_INST_0
       (.I0(ap_CS_fsm_state4),
        .I1(tmp_reg_174),
        .I2(ap_CS_fsm_state3),
        .I3(m_axis_TREADY),
        .O(m_axis_TVALID));
  FDRE \p_s_reg_191_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[32]),
        .Q(p_s_reg_191[0]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[42]),
        .Q(p_s_reg_191[10]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[43]),
        .Q(p_s_reg_191[11]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[44]),
        .Q(p_s_reg_191[12]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[45]),
        .Q(p_s_reg_191[13]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[46]),
        .Q(p_s_reg_191[14]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[47]),
        .Q(p_s_reg_191[15]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[48]),
        .Q(p_s_reg_191[16]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[49]),
        .Q(p_s_reg_191[17]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[50]),
        .Q(p_s_reg_191[18]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[51]),
        .Q(p_s_reg_191[19]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[33]),
        .Q(p_s_reg_191[1]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[52]),
        .Q(p_s_reg_191[20]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[53]),
        .Q(p_s_reg_191[21]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[54]),
        .Q(p_s_reg_191[22]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[55]),
        .Q(p_s_reg_191[23]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[56]),
        .Q(p_s_reg_191[24]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[57]),
        .Q(p_s_reg_191[25]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[58]),
        .Q(p_s_reg_191[26]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[59]),
        .Q(p_s_reg_191[27]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[60]),
        .Q(p_s_reg_191[28]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[61]),
        .Q(p_s_reg_191[29]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[34]),
        .Q(p_s_reg_191[2]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[62]),
        .Q(p_s_reg_191[30]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[63]),
        .Q(p_s_reg_191[31]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[35]),
        .Q(p_s_reg_191[3]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[36]),
        .Q(p_s_reg_191[4]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[37]),
        .Q(p_s_reg_191[5]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[38]),
        .Q(p_s_reg_191[6]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[39]),
        .Q(p_s_reg_191[7]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[40]),
        .Q(p_s_reg_191[8]),
        .R(1'b0));
  FDRE \p_s_reg_191_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state3),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[41]),
        .Q(p_s_reg_191[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    \state[5]_i_1 
       (.I0(tmp_reg_174),
        .I1(m_axis_TREADY),
        .I2(ap_CS_fsm_state4),
        .O(state0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[0]),
        .Q(state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[1]),
        .Q(state[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[2]),
        .Q(state[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[3]),
        .Q(state[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[4] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[4]),
        .Q(state[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[5] 
       (.C(ap_clk),
        .CE(state0),
        .D(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out[5]),
        .Q(state[5]),
        .R(1'b0));
  FDRE \tmp_reg_174_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(s_axis_TVALID),
        .Q(tmp_reg_174),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1" *) 
module bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1
   (SR,
    Q,
    D,
    s_axis_TREADY,
    \empty_fu_66_reg[5]_0 ,
    m_axis_TDATA,
    \ap_CS_fsm_reg[0] ,
    ap_clk,
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
    ap_rst_n,
    \m_axis_TDATA[31] ,
    m_axis_TREADY,
    \empty_fu_66_reg[5]_1 ,
    \empty_fu_66[0]_i_4_0 ,
    s_axis_TVALID,
    ap_start,
    \m_axis_TDATA[31]_0 ,
    tmp_reg_174);
  output [0:0]SR;
  output [31:0]Q;
  output [1:0]D;
  output s_axis_TREADY;
  output [5:0]\empty_fu_66_reg[5]_0 ;
  output [31:0]m_axis_TDATA;
  output \ap_CS_fsm_reg[0] ;
  input ap_clk;
  input grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg;
  input ap_rst_n;
  input [3:0]\m_axis_TDATA[31] ;
  input m_axis_TREADY;
  input [5:0]\empty_fu_66_reg[5]_1 ;
  input [31:0]\empty_fu_66[0]_i_4_0 ;
  input s_axis_TVALID;
  input ap_start;
  input [31:0]\m_axis_TDATA[31]_0 ;
  input [0:0]tmp_reg_174;

  wire [1:0]D;
  wire [31:0]Q;
  wire [0:0]SR;
  wire \ap_CS_fsm_reg[0] ;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_i_1_n_3;
  wire ap_loop_init;
  wire ap_rst_n;
  wire ap_start;
  wire empty_fu_660;
  wire \empty_fu_66[0]_i_10_n_3 ;
  wire \empty_fu_66[0]_i_11_n_3 ;
  wire \empty_fu_66[0]_i_12_n_3 ;
  wire \empty_fu_66[0]_i_3_n_3 ;
  wire [31:0]\empty_fu_66[0]_i_4_0 ;
  wire \empty_fu_66[0]_i_4_n_3 ;
  wire \empty_fu_66[0]_i_5_n_3 ;
  wire \empty_fu_66[0]_i_6_n_3 ;
  wire \empty_fu_66[0]_i_7_n_3 ;
  wire \empty_fu_66[0]_i_8_n_3 ;
  wire \empty_fu_66[0]_i_9_n_3 ;
  wire \empty_fu_66_reg[0]_i_2_n_3 ;
  wire [5:0]\empty_fu_66_reg[5]_0 ;
  wire [5:0]\empty_fu_66_reg[5]_1 ;
  wire [63:0]encoded_1_fu_247_p4;
  wire \encoded_fu_58[59]_i_2_n_3 ;
  wire \encoded_fu_58[61]_i_2_n_3 ;
  wire \encoded_fu_58[62]_i_2_n_3 ;
  wire \encoded_fu_58[63]_i_5_n_3 ;
  wire \encoded_fu_58[63]_i_6_n_3 ;
  wire \encoded_fu_58[63]_i_7_n_3 ;
  wire flow_control_loop_pipe_sequential_init_U_n_10;
  wire flow_control_loop_pipe_sequential_init_U_n_11;
  wire flow_control_loop_pipe_sequential_init_U_n_12;
  wire flow_control_loop_pipe_sequential_init_U_n_13;
  wire flow_control_loop_pipe_sequential_init_U_n_14;
  wire flow_control_loop_pipe_sequential_init_U_n_15;
  wire flow_control_loop_pipe_sequential_init_U_n_4;
  wire flow_control_loop_pipe_sequential_init_U_n_9;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg;
  wire [31:0]grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out;
  wire [5:1]i_2_fu_120_p2;
  wire \i_fu_62[0]_i_1_n_3 ;
  wire \i_fu_62[2]_i_1_n_3 ;
  wire [5:0]i_fu_62_reg;
  wire [31:0]m_axis_TDATA;
  wire [3:0]\m_axis_TDATA[31] ;
  wire [31:0]\m_axis_TDATA[31]_0 ;
  wire m_axis_TREADY;
  wire s_axis_TREADY;
  wire s_axis_TVALID;
  wire [0:0]tmp_reg_174;

  LUT3 #(
    .INIT(8'h08)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I1(ap_rst_n),
        .I2(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .O(ap_enable_reg_pp0_iter1_i_1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1_n_3),
        .Q(ap_enable_reg_pp0_iter1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_10 
       (.I0(\empty_fu_66[0]_i_4_0 [26]),
        .I1(\empty_fu_66[0]_i_4_0 [24]),
        .I2(\empty_fu_66[0]_i_4_0 [27]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [25]),
        .O(\empty_fu_66[0]_i_10_n_3 ));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_11 
       (.I0(\empty_fu_66[0]_i_4_0 [18]),
        .I1(\empty_fu_66[0]_i_4_0 [16]),
        .I2(\empty_fu_66[0]_i_4_0 [19]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [17]),
        .O(\empty_fu_66[0]_i_11_n_3 ));
  LUT6 #(
    .INIT(64'h33000F5533FF0F55)) 
    \empty_fu_66[0]_i_12 
       (.I0(\empty_fu_66[0]_i_4_0 [28]),
        .I1(\empty_fu_66[0]_i_4_0 [31]),
        .I2(\empty_fu_66[0]_i_4_0 [30]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [29]),
        .O(\empty_fu_66[0]_i_12_n_3 ));
  LUT6 #(
    .INIT(64'h0350F350035FF35F)) 
    \empty_fu_66[0]_i_3 
       (.I0(\empty_fu_66[0]_i_5_n_3 ),
        .I1(\empty_fu_66[0]_i_6_n_3 ),
        .I2(i_fu_62_reg[3]),
        .I3(i_fu_62_reg[2]),
        .I4(\empty_fu_66[0]_i_7_n_3 ),
        .I5(\empty_fu_66[0]_i_8_n_3 ),
        .O(\empty_fu_66[0]_i_3_n_3 ));
  LUT6 #(
    .INIT(64'h0530053FF530F53F)) 
    \empty_fu_66[0]_i_4 
       (.I0(\empty_fu_66[0]_i_9_n_3 ),
        .I1(\empty_fu_66[0]_i_10_n_3 ),
        .I2(i_fu_62_reg[3]),
        .I3(i_fu_62_reg[2]),
        .I4(\empty_fu_66[0]_i_11_n_3 ),
        .I5(\empty_fu_66[0]_i_12_n_3 ),
        .O(\empty_fu_66[0]_i_4_n_3 ));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_5 
       (.I0(\empty_fu_66[0]_i_4_0 [10]),
        .I1(\empty_fu_66[0]_i_4_0 [8]),
        .I2(\empty_fu_66[0]_i_4_0 [11]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [9]),
        .O(\empty_fu_66[0]_i_5_n_3 ));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_6 
       (.I0(\empty_fu_66[0]_i_4_0 [6]),
        .I1(\empty_fu_66[0]_i_4_0 [4]),
        .I2(\empty_fu_66[0]_i_4_0 [7]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [5]),
        .O(\empty_fu_66[0]_i_6_n_3 ));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_7 
       (.I0(\empty_fu_66[0]_i_4_0 [14]),
        .I1(\empty_fu_66[0]_i_4_0 [12]),
        .I2(\empty_fu_66[0]_i_4_0 [15]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [13]),
        .O(\empty_fu_66[0]_i_7_n_3 ));
  LUT6 #(
    .INIT(64'h0033550FFF33550F)) 
    \empty_fu_66[0]_i_8 
       (.I0(\empty_fu_66[0]_i_4_0 [2]),
        .I1(\empty_fu_66[0]_i_4_0 [1]),
        .I2(\empty_fu_66[0]_i_4_0 [0]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [3]),
        .O(\empty_fu_66[0]_i_8_n_3 ));
  LUT6 #(
    .INIT(64'h0F0055330FFF5533)) 
    \empty_fu_66[0]_i_9 
       (.I0(\empty_fu_66[0]_i_4_0 [22]),
        .I1(\empty_fu_66[0]_i_4_0 [20]),
        .I2(\empty_fu_66[0]_i_4_0 [23]),
        .I3(i_fu_62_reg[1]),
        .I4(i_fu_62_reg[0]),
        .I5(\empty_fu_66[0]_i_4_0 [21]),
        .O(\empty_fu_66[0]_i_9_n_3 ));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[0] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_15),
        .Q(\empty_fu_66_reg[5]_0 [0]),
        .R(1'b0));
  MUXF7 \empty_fu_66_reg[0]_i_2 
       (.I0(\empty_fu_66[0]_i_3_n_3 ),
        .I1(\empty_fu_66[0]_i_4_n_3 ),
        .O(\empty_fu_66_reg[0]_i_2_n_3 ),
        .S(i_fu_62_reg[4]));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[1] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_14),
        .Q(\empty_fu_66_reg[5]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[2] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_13),
        .Q(\empty_fu_66_reg[5]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[3] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_12),
        .Q(\empty_fu_66_reg[5]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[4] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_11),
        .Q(\empty_fu_66_reg[5]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \empty_fu_66_reg[5] 
       (.C(ap_clk),
        .CE(flow_control_loop_pipe_sequential_init_U_n_4),
        .D(flow_control_loop_pipe_sequential_init_U_n_10),
        .Q(\empty_fu_66_reg[5]_0 [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[0]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[0]),
        .I1(flow_control_loop_pipe_sequential_init_U_n_9),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[10]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[10]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[11]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[11]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[11]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[12]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[12]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[12]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[13]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[13]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[13]));
  LUT6 #(
    .INIT(64'hAAA8AAAAAAABAAAA)) 
    \encoded_fu_58[14]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[14]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(\encoded_fu_58[63]_i_6_n_3 ),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[14]));
  LUT6 #(
    .INIT(64'hAAA8AAAAAAABAAAA)) 
    \encoded_fu_58[15]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[15]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(\encoded_fu_58[63]_i_6_n_3 ),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[15]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[16]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[16]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[16]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[17]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[17]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[17]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[18]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[18]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[18]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[19]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[19]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[19]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[1]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[1]),
        .I1(flow_control_loop_pipe_sequential_init_U_n_9),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[20]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[20]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[20]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[21]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[21]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[21]));
  LUT6 #(
    .INIT(64'hAAA8AAAAAAABAAAA)) 
    \encoded_fu_58[22]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[22]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[22]));
  LUT6 #(
    .INIT(64'hAAA8AAAAAAABAAAA)) 
    \encoded_fu_58[23]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[23]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[23]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[24]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[24]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[24]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[25]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[25]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[25]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[26]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[26]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[26]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[27]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[27]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[27]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[28]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[28]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[28]));
  LUT6 #(
    .INIT(64'hAAAAAAAAA3AAAAAA)) 
    \encoded_fu_58[29]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[29]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[29]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[2]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[2]),
        .I1(\encoded_fu_58[59]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[2]));
  LUT6 #(
    .INIT(64'hAA8AAAAAAABAAAAA)) 
    \encoded_fu_58[30]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[30]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[30]));
  LUT6 #(
    .INIT(64'hAA8AAAAAAABAAAAA)) 
    \encoded_fu_58[31]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[31]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[31]));
  LUT6 #(
    .INIT(64'hAAAAAAA2AAAAAAAE)) 
    \encoded_fu_58[32]_i_1 
       (.I0(Q[0]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(flow_control_loop_pipe_sequential_init_U_n_9),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[32]));
  LUT6 #(
    .INIT(64'hAAAAAAA2AAAAAAAE)) 
    \encoded_fu_58[33]_i_1 
       (.I0(Q[1]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(flow_control_loop_pipe_sequential_init_U_n_9),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[33]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[34]_i_1 
       (.I0(Q[2]),
        .I1(\encoded_fu_58[59]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[34]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[35]_i_1 
       (.I0(Q[3]),
        .I1(\encoded_fu_58[59]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[35]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[36]_i_1 
       (.I0(Q[4]),
        .I1(\encoded_fu_58[61]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[36]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[37]_i_1 
       (.I0(Q[5]),
        .I1(\encoded_fu_58[61]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[37]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[38]_i_1 
       (.I0(Q[6]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[38]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAABAA)) 
    \encoded_fu_58[39]_i_1 
       (.I0(Q[7]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[39]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[3]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[3]),
        .I1(\encoded_fu_58[59]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[3]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[40]_i_1 
       (.I0(Q[8]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[40]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[41]_i_1 
       (.I0(Q[9]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[41]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[42]_i_1 
       (.I0(Q[10]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[42]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[43]_i_1 
       (.I0(Q[11]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[43]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[44]_i_1 
       (.I0(Q[12]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[44]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[45]_i_1 
       (.I0(Q[13]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[45]));
  LUT6 #(
    .INIT(64'hAAA2AAAAAAAEAAAA)) 
    \encoded_fu_58[46]_i_1 
       (.I0(Q[14]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(\encoded_fu_58[63]_i_6_n_3 ),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[46]));
  LUT6 #(
    .INIT(64'hAAA2AAAAAAAEAAAA)) 
    \encoded_fu_58[47]_i_1 
       (.I0(Q[15]),
        .I1(i_fu_62_reg[4]),
        .I2(i_fu_62_reg[3]),
        .I3(\encoded_fu_58[63]_i_6_n_3 ),
        .I4(i_fu_62_reg[2]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[47]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[48]_i_1 
       (.I0(Q[16]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[48]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[49]_i_1 
       (.I0(Q[17]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[49]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[4]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[4]),
        .I1(\encoded_fu_58[61]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[4]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[50]_i_1 
       (.I0(Q[18]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[50]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[51]_i_1 
       (.I0(Q[19]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[51]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[52]_i_1 
       (.I0(Q[20]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[52]));
  LUT6 #(
    .INIT(64'hAAA3AAAAAAAAAAAA)) 
    \encoded_fu_58[53]_i_1 
       (.I0(Q[21]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[53]));
  LUT6 #(
    .INIT(64'hA8AAAAAAABAAAAAA)) 
    \encoded_fu_58[54]_i_1 
       (.I0(Q[22]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[54]));
  LUT6 #(
    .INIT(64'hA8AAAAAAABAAAAAA)) 
    \encoded_fu_58[55]_i_1 
       (.I0(Q[23]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[55]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[56]_i_1 
       (.I0(Q[24]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[56]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[57]_i_1 
       (.I0(Q[25]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[57]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[58]_i_1 
       (.I0(Q[26]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[58]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[59]_i_1 
       (.I0(Q[27]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[59]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[59]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \encoded_fu_58[59]_i_2 
       (.I0(i_fu_62_reg[1]),
        .I1(i_fu_62_reg[0]),
        .O(\encoded_fu_58[59]_i_2_n_3 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[5]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[5]),
        .I1(\encoded_fu_58[61]_i_2_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[5]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[60]_i_1 
       (.I0(Q[28]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[60]));
  LUT6 #(
    .INIT(64'hA3AAAAAAAAAAAAAA)) 
    \encoded_fu_58[61]_i_1 
       (.I0(Q[29]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(\encoded_fu_58[61]_i_2_n_3 ),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[61]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \encoded_fu_58[61]_i_2 
       (.I0(i_fu_62_reg[0]),
        .I1(i_fu_62_reg[1]),
        .O(\encoded_fu_58[61]_i_2_n_3 ));
  LUT6 #(
    .INIT(64'hDFFFFFFF10000000)) 
    \encoded_fu_58[62]_i_1 
       (.I0(\encoded_fu_58[62]_i_2_n_3 ),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(Q[30]),
        .O(encoded_1_fu_247_p4[62]));
  LUT6 #(
    .INIT(64'hB84747B847B8B847)) 
    \encoded_fu_58[62]_i_2 
       (.I0(\empty_fu_66[0]_i_4_n_3 ),
        .I1(i_fu_62_reg[4]),
        .I2(\empty_fu_66[0]_i_3_n_3 ),
        .I3(\empty_fu_66_reg[5]_0 [5]),
        .I4(\encoded_fu_58[63]_i_7_n_3 ),
        .I5(\empty_fu_66_reg[5]_0 [0]),
        .O(\encoded_fu_58[62]_i_2_n_3 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA2)) 
    \encoded_fu_58[63]_i_2 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(i_fu_62_reg[5]),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[4]),
        .I5(i_fu_62_reg[3]),
        .O(empty_fu_660));
  LUT6 #(
    .INIT(64'hDFFFFFFF10000000)) 
    \encoded_fu_58[63]_i_3 
       (.I0(\encoded_fu_58[63]_i_5_n_3 ),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(Q[31]),
        .O(encoded_1_fu_247_p4[63]));
  LUT6 #(
    .INIT(64'hB84747B847B8B847)) 
    \encoded_fu_58[63]_i_5 
       (.I0(\empty_fu_66[0]_i_4_n_3 ),
        .I1(i_fu_62_reg[4]),
        .I2(\empty_fu_66[0]_i_3_n_3 ),
        .I3(\empty_fu_66_reg[5]_0 [5]),
        .I4(\encoded_fu_58[63]_i_7_n_3 ),
        .I5(\empty_fu_66_reg[5]_0 [4]),
        .O(\encoded_fu_58[63]_i_5_n_3 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \encoded_fu_58[63]_i_6 
       (.I0(i_fu_62_reg[0]),
        .I1(i_fu_62_reg[1]),
        .O(\encoded_fu_58[63]_i_6_n_3 ));
  LUT2 #(
    .INIT(4'h6)) 
    \encoded_fu_58[63]_i_7 
       (.I0(\empty_fu_66_reg[5]_0 [1]),
        .I1(\empty_fu_66_reg[5]_0 [2]),
        .O(\encoded_fu_58[63]_i_7_n_3 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[6]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[6]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[62]_i_2_n_3 ),
        .O(encoded_1_fu_247_p4[6]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAB)) 
    \encoded_fu_58[7]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[7]),
        .I1(\encoded_fu_58[63]_i_6_n_3 ),
        .I2(i_fu_62_reg[2]),
        .I3(i_fu_62_reg[4]),
        .I4(i_fu_62_reg[3]),
        .I5(\encoded_fu_58[63]_i_5_n_3 ),
        .O(encoded_1_fu_247_p4[7]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[8]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[8]),
        .I1(\encoded_fu_58[62]_i_2_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAA3AAAA)) 
    \encoded_fu_58[9]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[9]),
        .I1(\encoded_fu_58[63]_i_5_n_3 ),
        .I2(flow_control_loop_pipe_sequential_init_U_n_9),
        .I3(i_fu_62_reg[3]),
        .I4(i_fu_62_reg[2]),
        .I5(i_fu_62_reg[4]),
        .O(encoded_1_fu_247_p4[9]));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[0] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[0]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[0]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[10] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[10]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[10]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[11] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[11]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[11]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[12] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[12]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[12]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[13] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[13]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[13]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[14] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[14]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[14]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[15] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[15]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[15]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[16] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[16]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[16]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[17] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[17]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[17]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[18] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[18]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[18]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[19] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[19]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[19]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[1] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[1]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[1]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[20] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[20]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[20]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[21] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[21]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[21]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[22] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[22]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[22]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[23] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[23]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[23]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[24] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[24]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[24]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[25] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[25]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[25]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[26] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[26]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[26]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[27] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[27]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[27]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[28] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[28]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[28]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[29] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[29]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[29]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[2] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[2]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[2]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[30] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[30]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[30]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[31] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[31]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[31]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[32] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[32]),
        .Q(Q[0]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[33] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[33]),
        .Q(Q[1]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[34] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[34]),
        .Q(Q[2]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[35] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[35]),
        .Q(Q[3]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[36] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[36]),
        .Q(Q[4]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[37] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[37]),
        .Q(Q[5]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[38] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[38]),
        .Q(Q[6]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[39] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[39]),
        .Q(Q[7]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[3] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[3]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[3]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[40] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[40]),
        .Q(Q[8]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[41] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[41]),
        .Q(Q[9]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[42] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[42]),
        .Q(Q[10]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[43] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[43]),
        .Q(Q[11]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[44] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[44]),
        .Q(Q[12]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[45] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[45]),
        .Q(Q[13]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[46] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[46]),
        .Q(Q[14]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[47] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[47]),
        .Q(Q[15]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[48] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[48]),
        .Q(Q[16]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[49] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[49]),
        .Q(Q[17]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[4] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[4]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[4]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[50] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[50]),
        .Q(Q[18]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[51] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[51]),
        .Q(Q[19]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[52] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[52]),
        .Q(Q[20]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[53] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[53]),
        .Q(Q[21]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[54] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[54]),
        .Q(Q[22]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[55] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[55]),
        .Q(Q[23]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[56] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[56]),
        .Q(Q[24]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[57] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[57]),
        .Q(Q[25]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[58] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[58]),
        .Q(Q[26]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[59] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[59]),
        .Q(Q[27]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[5] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[5]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[5]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[60] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[60]),
        .Q(Q[28]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[61] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[61]),
        .Q(Q[29]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[62] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[62]),
        .Q(Q[30]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[63] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[63]),
        .Q(Q[31]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[6] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[6]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[6]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[7] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[7]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[7]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[8] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[8]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[8]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \encoded_fu_58_reg[9] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(encoded_1_fu_247_p4[9]),
        .Q(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[9]),
        .R(ap_loop_init));
  bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U
       (.D(D),
        .E(flow_control_loop_pipe_sequential_init_U_n_4),
        .Q(i_fu_62_reg),
        .SR(SR),
        .\ap_CS_fsm_reg[2] (\m_axis_TDATA[31] [2:0]),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\empty_fu_66_reg[0] (empty_fu_660),
        .\empty_fu_66_reg[0]_0 (\empty_fu_66_reg[0]_i_2_n_3 ),
        .\empty_fu_66_reg[5] (\empty_fu_66_reg[5]_1 ),
        .\empty_fu_66_reg[5]_0 (\empty_fu_66_reg[5]_0 [4:0]),
        .grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg(ap_loop_init),
        .\i_fu_62_reg[0] (flow_control_loop_pipe_sequential_init_U_n_9),
        .m_axis_TREADY(m_axis_TREADY),
        .s_axis_TREADY(s_axis_TREADY),
        .s_axis_TVALID(s_axis_TVALID),
        .\state_reg[5] ({flow_control_loop_pipe_sequential_init_U_n_10,flow_control_loop_pipe_sequential_init_U_n_11,flow_control_loop_pipe_sequential_init_U_n_12,flow_control_loop_pipe_sequential_init_U_n_13,flow_control_loop_pipe_sequential_init_U_n_14,flow_control_loop_pipe_sequential_init_U_n_15}));
  LUT5 #(
    .INIT(32'hD555C000)) 
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_i_1
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .I1(\m_axis_TDATA[31] [0]),
        .I2(ap_start),
        .I3(s_axis_TVALID),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .O(\ap_CS_fsm_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \i_fu_62[0]_i_1 
       (.I0(i_fu_62_reg[0]),
        .O(\i_fu_62[0]_i_1_n_3 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \i_fu_62[1]_i_1 
       (.I0(i_fu_62_reg[0]),
        .I1(i_fu_62_reg[1]),
        .O(i_2_fu_120_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \i_fu_62[2]_i_1 
       (.I0(i_fu_62_reg[2]),
        .I1(i_fu_62_reg[1]),
        .I2(i_fu_62_reg[0]),
        .O(\i_fu_62[2]_i_1_n_3 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \i_fu_62[3]_i_1 
       (.I0(i_fu_62_reg[3]),
        .I1(i_fu_62_reg[0]),
        .I2(i_fu_62_reg[1]),
        .I3(i_fu_62_reg[2]),
        .O(i_2_fu_120_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \i_fu_62[4]_i_1 
       (.I0(i_fu_62_reg[4]),
        .I1(i_fu_62_reg[0]),
        .I2(i_fu_62_reg[1]),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[3]),
        .O(i_2_fu_120_p2[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \i_fu_62[5]_i_1 
       (.I0(i_fu_62_reg[5]),
        .I1(i_fu_62_reg[3]),
        .I2(i_fu_62_reg[4]),
        .I3(i_fu_62_reg[2]),
        .I4(i_fu_62_reg[1]),
        .I5(i_fu_62_reg[0]),
        .O(i_2_fu_120_p2[5]));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[0] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(\i_fu_62[0]_i_1_n_3 ),
        .Q(i_fu_62_reg[0]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[1] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(i_2_fu_120_p2[1]),
        .Q(i_fu_62_reg[1]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[2] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(\i_fu_62[2]_i_1_n_3 ),
        .Q(i_fu_62_reg[2]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[3] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(i_2_fu_120_p2[3]),
        .Q(i_fu_62_reg[3]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[4] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(i_2_fu_120_p2[4]),
        .Q(i_fu_62_reg[4]),
        .R(ap_loop_init));
  FDRE #(
    .INIT(1'b0)) 
    \i_fu_62_reg[5] 
       (.C(ap_clk),
        .CE(empty_fu_660),
        .D(i_2_fu_120_p2[5]),
        .Q(i_fu_62_reg[5]),
        .R(ap_loop_init));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[0]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [0]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[0]),
        .O(m_axis_TDATA[0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[10]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [10]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[10]),
        .O(m_axis_TDATA[10]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[11]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [11]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[11]),
        .O(m_axis_TDATA[11]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[12]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [12]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[12]),
        .O(m_axis_TDATA[12]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[13]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [13]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[13]),
        .O(m_axis_TDATA[13]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[14]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [14]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[14]),
        .O(m_axis_TDATA[14]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[15]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [15]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[15]),
        .O(m_axis_TDATA[15]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[16]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [16]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[16]),
        .O(m_axis_TDATA[16]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[17]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [17]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[17]),
        .O(m_axis_TDATA[17]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[18]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [18]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[18]),
        .O(m_axis_TDATA[18]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[19]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [19]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[19]),
        .O(m_axis_TDATA[19]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[1]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [1]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[1]),
        .O(m_axis_TDATA[1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[20]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [20]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[20]),
        .O(m_axis_TDATA[20]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[21]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [21]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[21]),
        .O(m_axis_TDATA[21]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[22]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [22]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[22]),
        .O(m_axis_TDATA[22]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[23]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [23]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[23]),
        .O(m_axis_TDATA[23]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[24]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [24]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[24]),
        .O(m_axis_TDATA[24]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[25]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [25]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[25]),
        .O(m_axis_TDATA[25]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[26]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [26]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[26]),
        .O(m_axis_TDATA[26]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[27]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [27]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[27]),
        .O(m_axis_TDATA[27]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[28]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [28]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[28]),
        .O(m_axis_TDATA[28]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[29]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [29]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[29]),
        .O(m_axis_TDATA[29]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[2]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [2]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[2]),
        .O(m_axis_TDATA[2]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[30]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [30]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[30]),
        .O(m_axis_TDATA[30]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[31]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [31]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[31]),
        .O(m_axis_TDATA[31]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[3]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [3]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[3]),
        .O(m_axis_TDATA[3]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[4]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [4]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[4]),
        .O(m_axis_TDATA[4]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[5]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [5]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[5]),
        .O(m_axis_TDATA[5]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[6]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [6]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[6]),
        .O(m_axis_TDATA[6]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[7]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [7]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[7]),
        .O(m_axis_TDATA[7]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[8]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [8]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[8]),
        .O(m_axis_TDATA[8]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \m_axis_TDATA[9]_INST_0 
       (.I0(\m_axis_TDATA[31]_0 [9]),
        .I1(tmp_reg_174),
        .I2(m_axis_TREADY),
        .I3(\m_axis_TDATA[31] [3]),
        .I4(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out[9]),
        .O(m_axis_TDATA[9]));
endmodule

(* ORIG_REF_NAME = "convEncoder_Seq_flow_control_loop_pipe_sequential_init" *) 
module bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init
   (SR,
    E,
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready,
    D,
    s_axis_TREADY,
    \i_fu_62_reg[0] ,
    \state_reg[5] ,
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg,
    ap_clk,
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
    \empty_fu_66_reg[0] ,
    ap_rst_n,
    \ap_CS_fsm_reg[2] ,
    m_axis_TREADY,
    ap_enable_reg_pp0_iter1,
    Q,
    \empty_fu_66_reg[5] ,
    \empty_fu_66_reg[0]_0 ,
    \empty_fu_66_reg[5]_0 ,
    s_axis_TVALID,
    ap_start);
  output [0:0]SR;
  output [0:0]E;
  output grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready;
  output [1:0]D;
  output s_axis_TREADY;
  output \i_fu_62_reg[0] ;
  output [5:0]\state_reg[5] ;
  output [0:0]grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg;
  input ap_clk;
  input grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg;
  input [0:0]\empty_fu_66_reg[0] ;
  input ap_rst_n;
  input [2:0]\ap_CS_fsm_reg[2] ;
  input m_axis_TREADY;
  input ap_enable_reg_pp0_iter1;
  input [5:0]Q;
  input [5:0]\empty_fu_66_reg[5] ;
  input \empty_fu_66_reg[0]_0 ;
  input [4:0]\empty_fu_66_reg[5]_0 ;
  input s_axis_TVALID;
  input ap_start;

  wire [1:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SR;
  wire [2:0]\ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1_n_3;
  wire ap_enable_reg_pp0_iter1;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1_n_3;
  wire ap_rst_n;
  wire ap_start;
  wire [0:0]\empty_fu_66_reg[0] ;
  wire \empty_fu_66_reg[0]_0 ;
  wire [5:0]\empty_fu_66_reg[5] ;
  wire [4:0]\empty_fu_66_reg[5]_0 ;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready;
  wire grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg;
  wire [0:0]grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg;
  wire \i_fu_62_reg[0] ;
  wire m_axis_TREADY;
  wire s_axis_TREADY;
  wire s_axis_TVALID;
  wire [5:0]\state_reg[5] ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBABBAAAA)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(s_axis_TREADY),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .I2(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I3(ap_done_cache),
        .I4(\ap_CS_fsm_reg[2] [1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hBA00FFFFBA00BA00)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_done_cache),
        .I3(\ap_CS_fsm_reg[2] [1]),
        .I4(m_axis_TREADY),
        .I5(\ap_CS_fsm_reg[2] [2]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \ap_CS_fsm[2]_i_2 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(Q[5]),
        .I2(\i_fu_62_reg[0] ),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[3]),
        .O(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready));
  LUT1 #(
    .INIT(2'h1)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(ap_rst_n),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hDC)) 
    ap_done_cache_i_1
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .I2(ap_done_cache),
        .O(ap_done_cache_i_1_n_3));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1_n_3),
        .Q(ap_done_cache),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFF4F)) 
    ap_loop_init_int_i_1
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I1(ap_loop_init_int),
        .I2(ap_rst_n),
        .I3(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready),
        .O(ap_loop_init_int_i_1_n_3));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1_n_3),
        .Q(ap_loop_init_int),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[0]_i_1 
       (.I0(\empty_fu_66_reg[5] [0]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[0]_0 ),
        .O(\state_reg[5] [0]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[1]_i_1 
       (.I0(\empty_fu_66_reg[5] [1]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[5]_0 [0]),
        .O(\state_reg[5] [1]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[2]_i_1 
       (.I0(\empty_fu_66_reg[5] [2]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[5]_0 [1]),
        .O(\state_reg[5] [2]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[3]_i_1 
       (.I0(\empty_fu_66_reg[5] [3]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[5]_0 [2]),
        .O(\state_reg[5] [3]));
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[4]_i_1 
       (.I0(\empty_fu_66_reg[5] [4]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[5]_0 [3]),
        .O(\state_reg[5] [4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \empty_fu_66[5]_i_1 
       (.I0(ap_loop_init_int),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(\empty_fu_66_reg[0] ),
        .O(E));
  LUT4 #(
    .INIT(16'hBF80)) 
    \empty_fu_66[5]_i_2 
       (.I0(\empty_fu_66_reg[5] [5]),
        .I1(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I2(ap_loop_init_int),
        .I3(\empty_fu_66_reg[5]_0 [4]),
        .O(\state_reg[5] [5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \encoded_fu_58[63]_i_1 
       (.I0(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg),
        .I1(ap_loop_init_int),
        .O(grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg));
  LUT2 #(
    .INIT(4'hE)) 
    \encoded_fu_58[63]_i_4 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\i_fu_62_reg[0] ));
  LUT3 #(
    .INIT(8'h80)) 
    s_axis_TREADY_INST_0
       (.I0(s_axis_TVALID),
        .I1(ap_start),
        .I2(\ap_CS_fsm_reg[2] [0]),
        .O(s_axis_TREADY));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
