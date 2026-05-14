-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed Mar 18 16:08:39 2026
-- Host        : Dulina running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Vitis_HLS/gmskModem/convEncoder/convEncoder/hls/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_sim_netlist.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_TREADY : out STD_LOGIC;
    \i_fu_62_reg[0]\ : out STD_LOGIC;
    \state_reg[5]\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg : in STD_LOGIC;
    \empty_fu_66_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_rst_n : in STD_LOGIC;
    \ap_CS_fsm_reg[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_TREADY : in STD_LOGIC;
    ap_enable_reg_pp0_iter1 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \empty_fu_66_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \empty_fu_66_reg[0]_0\ : in STD_LOGIC;
    \empty_fu_66_reg[5]_0\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_TVALID : in STD_LOGIC;
    ap_start : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init : entity is "convEncoder_Seq_flow_control_loop_pipe_sequential_init";
end bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init;

architecture STRUCTURE of bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ap_done_cache : STD_LOGIC;
  signal ap_done_cache_i_1_n_3 : STD_LOGIC;
  signal ap_loop_init_int : STD_LOGIC;
  signal ap_loop_init_int_i_1_n_3 : STD_LOGIC;
  signal \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\ : STD_LOGIC;
  signal \^i_fu_62_reg[0]\ : STD_LOGIC;
  signal \^s_axis_tready\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ap_done_cache_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ap_loop_init_int_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \empty_fu_66[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \empty_fu_66[5]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \encoded_fu_58[63]_i_1\ : label is "soft_lutpair2";
begin
  SR(0) <= \^sr\(0);
  grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready <= \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\;
  \i_fu_62_reg[0]\ <= \^i_fu_62_reg[0]\;
  s_axis_TREADY <= \^s_axis_tready\;
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABBAAAA"
    )
        port map (
      I0 => \^s_axis_tready\,
      I1 => \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\,
      I2 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I3 => ap_done_cache,
      I4 => \ap_CS_fsm_reg[2]\(1),
      O => D(0)
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BA00FFFFBA00BA00"
    )
        port map (
      I0 => \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\,
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_done_cache,
      I3 => \ap_CS_fsm_reg[2]\(1),
      I4 => m_axis_TREADY,
      I5 => \ap_CS_fsm_reg[2]\(2),
      O => D(1)
    );
\ap_CS_fsm[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => Q(5),
      I2 => \^i_fu_62_reg[0]\,
      I3 => Q(2),
      I4 => Q(4),
      I5 => Q(3),
      O => \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\
    );
\ap_CS_fsm[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => \^sr\(0)
    );
ap_done_cache_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DC"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I1 => \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\,
      I2 => ap_done_cache,
      O => ap_done_cache_i_1_n_3
    );
ap_done_cache_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_done_cache_i_1_n_3,
      Q => ap_done_cache,
      R => \^sr\(0)
    );
ap_loop_init_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4F"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I1 => ap_loop_init_int,
      I2 => ap_rst_n,
      I3 => \^grp_convencoder_seq_pipeline_vitis_loop_40_1_fu_115_ap_ready\,
      O => ap_loop_init_int_i_1_n_3
    );
ap_loop_init_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_loop_init_int_i_1_n_3,
      Q => ap_loop_init_int,
      R => '0'
    );
\empty_fu_66[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(0),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[0]_0\,
      O => \state_reg[5]\(0)
    );
\empty_fu_66[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(1),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[5]_0\(0),
      O => \state_reg[5]\(1)
    );
\empty_fu_66[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(2),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[5]_0\(1),
      O => \state_reg[5]\(2)
    );
\empty_fu_66[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(3),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[5]_0\(2),
      O => \state_reg[5]\(3)
    );
\empty_fu_66[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(4),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[5]_0\(3),
      O => \state_reg[5]\(4)
    );
\empty_fu_66[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ap_loop_init_int,
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => \empty_fu_66_reg[0]\(0),
      O => E(0)
    );
\empty_fu_66[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \empty_fu_66_reg[5]\(5),
      I1 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I2 => ap_loop_init_int,
      I3 => \empty_fu_66_reg[5]_0\(4),
      O => \state_reg[5]\(5)
    );
\encoded_fu_58[63]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I1 => ap_loop_init_int,
      O => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg(0)
    );
\encoded_fu_58[63]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \^i_fu_62_reg[0]\
    );
s_axis_TREADY_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axis_TVALID,
      I1 => ap_start,
      I2 => \ap_CS_fsm_reg[2]\(0),
      O => \^s_axis_tready\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_TREADY : out STD_LOGIC;
    \empty_fu_66_reg[5]_0\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axis_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \ap_CS_fsm_reg[0]\ : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    \m_axis_TDATA[31]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_TREADY : in STD_LOGIC;
    \empty_fu_66_reg[5]_1\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \empty_fu_66[0]_i_4_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_TVALID : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    \m_axis_TDATA[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tmp_reg_174 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 : entity is "convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1";
end bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1;

architecture STRUCTURE of bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 is
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ap_enable_reg_pp0_iter1 : STD_LOGIC;
  signal ap_enable_reg_pp0_iter1_i_1_n_3 : STD_LOGIC;
  signal ap_loop_init : STD_LOGIC;
  signal empty_fu_660 : STD_LOGIC;
  signal \empty_fu_66[0]_i_10_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_11_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_12_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_3_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_4_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_5_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_6_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_7_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_8_n_3\ : STD_LOGIC;
  signal \empty_fu_66[0]_i_9_n_3\ : STD_LOGIC;
  signal \empty_fu_66_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \^empty_fu_66_reg[5]_0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal encoded_1_fu_247_p4 : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \encoded_fu_58[59]_i_2_n_3\ : STD_LOGIC;
  signal \encoded_fu_58[61]_i_2_n_3\ : STD_LOGIC;
  signal \encoded_fu_58[62]_i_2_n_3\ : STD_LOGIC;
  signal \encoded_fu_58[63]_i_5_n_3\ : STD_LOGIC;
  signal \encoded_fu_58[63]_i_6_n_3\ : STD_LOGIC;
  signal \encoded_fu_58[63]_i_7_n_3\ : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_10 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_11 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_12 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_13 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_14 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_15 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_4 : STD_LOGIC;
  signal flow_control_loop_pipe_sequential_init_U_n_9 : STD_LOGIC;
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready : STD_LOGIC;
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal i_2_fu_120_p2 : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal \i_fu_62[0]_i_1_n_3\ : STD_LOGIC;
  signal \i_fu_62[2]_i_1_n_3\ : STD_LOGIC;
  signal i_fu_62_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \encoded_fu_58[59]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \encoded_fu_58[61]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \encoded_fu_58[63]_i_6\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \i_fu_62[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \i_fu_62[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \i_fu_62[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \i_fu_62[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \i_fu_62[4]_i_1\ : label is "soft_lutpair3";
begin
  Q(31 downto 0) <= \^q\(31 downto 0);
  \empty_fu_66_reg[5]_0\(5 downto 0) <= \^empty_fu_66_reg[5]_0\(5 downto 0);
ap_enable_reg_pp0_iter1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      I1 => ap_rst_n,
      I2 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready,
      O => ap_enable_reg_pp0_iter1_i_1_n_3
    );
ap_enable_reg_pp0_iter1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_enable_reg_pp0_iter1_i_1_n_3,
      Q => ap_enable_reg_pp0_iter1,
      R => '0'
    );
\empty_fu_66[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(26),
      I1 => \empty_fu_66[0]_i_4_0\(24),
      I2 => \empty_fu_66[0]_i_4_0\(27),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(25),
      O => \empty_fu_66[0]_i_10_n_3\
    );
\empty_fu_66[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(18),
      I1 => \empty_fu_66[0]_i_4_0\(16),
      I2 => \empty_fu_66[0]_i_4_0\(19),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(17),
      O => \empty_fu_66[0]_i_11_n_3\
    );
\empty_fu_66[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33000F5533FF0F55"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(28),
      I1 => \empty_fu_66[0]_i_4_0\(31),
      I2 => \empty_fu_66[0]_i_4_0\(30),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(29),
      O => \empty_fu_66[0]_i_12_n_3\
    );
\empty_fu_66[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0350F350035FF35F"
    )
        port map (
      I0 => \empty_fu_66[0]_i_5_n_3\,
      I1 => \empty_fu_66[0]_i_6_n_3\,
      I2 => i_fu_62_reg(3),
      I3 => i_fu_62_reg(2),
      I4 => \empty_fu_66[0]_i_7_n_3\,
      I5 => \empty_fu_66[0]_i_8_n_3\,
      O => \empty_fu_66[0]_i_3_n_3\
    );
\empty_fu_66[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0530053FF530F53F"
    )
        port map (
      I0 => \empty_fu_66[0]_i_9_n_3\,
      I1 => \empty_fu_66[0]_i_10_n_3\,
      I2 => i_fu_62_reg(3),
      I3 => i_fu_62_reg(2),
      I4 => \empty_fu_66[0]_i_11_n_3\,
      I5 => \empty_fu_66[0]_i_12_n_3\,
      O => \empty_fu_66[0]_i_4_n_3\
    );
\empty_fu_66[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(10),
      I1 => \empty_fu_66[0]_i_4_0\(8),
      I2 => \empty_fu_66[0]_i_4_0\(11),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(9),
      O => \empty_fu_66[0]_i_5_n_3\
    );
\empty_fu_66[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(6),
      I1 => \empty_fu_66[0]_i_4_0\(4),
      I2 => \empty_fu_66[0]_i_4_0\(7),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(5),
      O => \empty_fu_66[0]_i_6_n_3\
    );
\empty_fu_66[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(14),
      I1 => \empty_fu_66[0]_i_4_0\(12),
      I2 => \empty_fu_66[0]_i_4_0\(15),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(13),
      O => \empty_fu_66[0]_i_7_n_3\
    );
\empty_fu_66[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033550FFF33550F"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(2),
      I1 => \empty_fu_66[0]_i_4_0\(1),
      I2 => \empty_fu_66[0]_i_4_0\(0),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(3),
      O => \empty_fu_66[0]_i_8_n_3\
    );
\empty_fu_66[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0055330FFF5533"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_0\(22),
      I1 => \empty_fu_66[0]_i_4_0\(20),
      I2 => \empty_fu_66[0]_i_4_0\(23),
      I3 => i_fu_62_reg(1),
      I4 => i_fu_62_reg(0),
      I5 => \empty_fu_66[0]_i_4_0\(21),
      O => \empty_fu_66[0]_i_9_n_3\
    );
\empty_fu_66_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_15,
      Q => \^empty_fu_66_reg[5]_0\(0),
      R => '0'
    );
\empty_fu_66_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \empty_fu_66[0]_i_3_n_3\,
      I1 => \empty_fu_66[0]_i_4_n_3\,
      O => \empty_fu_66_reg[0]_i_2_n_3\,
      S => i_fu_62_reg(4)
    );
\empty_fu_66_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_14,
      Q => \^empty_fu_66_reg[5]_0\(1),
      R => '0'
    );
\empty_fu_66_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_13,
      Q => \^empty_fu_66_reg[5]_0\(2),
      R => '0'
    );
\empty_fu_66_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_12,
      Q => \^empty_fu_66_reg[5]_0\(3),
      R => '0'
    );
\empty_fu_66_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_11,
      Q => \^empty_fu_66_reg[5]_0\(4),
      R => '0'
    );
\empty_fu_66_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => flow_control_loop_pipe_sequential_init_U_n_4,
      D => flow_control_loop_pipe_sequential_init_U_n_10,
      Q => \^empty_fu_66_reg[5]_0\(5),
      R => '0'
    );
\encoded_fu_58[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(0),
      I1 => flow_control_loop_pipe_sequential_init_U_n_9,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(0)
    );
\encoded_fu_58[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(10),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(10)
    );
\encoded_fu_58[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(11),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(11)
    );
\encoded_fu_58[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(12),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(12)
    );
\encoded_fu_58[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(13),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(13)
    );
\encoded_fu_58[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAABAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(14),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => \encoded_fu_58[63]_i_6_n_3\,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(14)
    );
\encoded_fu_58[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAABAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(15),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => \encoded_fu_58[63]_i_6_n_3\,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(15)
    );
\encoded_fu_58[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(16),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(16)
    );
\encoded_fu_58[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(17),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(17)
    );
\encoded_fu_58[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(18),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(18)
    );
\encoded_fu_58[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(19),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(19)
    );
\encoded_fu_58[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(1),
      I1 => flow_control_loop_pipe_sequential_init_U_n_9,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(1)
    );
\encoded_fu_58[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(20),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(20)
    );
\encoded_fu_58[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(21),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(21)
    );
\encoded_fu_58[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAABAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(22),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(22)
    );
\encoded_fu_58[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAABAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(23),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(23)
    );
\encoded_fu_58[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(24),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(24)
    );
\encoded_fu_58[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(25),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(25)
    );
\encoded_fu_58[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(26),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(26)
    );
\encoded_fu_58[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(27),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(27)
    );
\encoded_fu_58[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(28),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(28)
    );
\encoded_fu_58[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA3AAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(29),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(29)
    );
\encoded_fu_58[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(2),
      I1 => \encoded_fu_58[59]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(2)
    );
\encoded_fu_58[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA8AAAAAAABAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(30),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(30)
    );
\encoded_fu_58[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA8AAAAAAABAAAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(31),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(31)
    );
\encoded_fu_58[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA2AAAAAAAE"
    )
        port map (
      I0 => \^q\(0),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => flow_control_loop_pipe_sequential_init_U_n_9,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(32)
    );
\encoded_fu_58[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA2AAAAAAAE"
    )
        port map (
      I0 => \^q\(1),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => flow_control_loop_pipe_sequential_init_U_n_9,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(33)
    );
\encoded_fu_58[34]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \encoded_fu_58[59]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(34)
    );
\encoded_fu_58[35]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \encoded_fu_58[59]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(35)
    );
\encoded_fu_58[36]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \encoded_fu_58[61]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(36)
    );
\encoded_fu_58[37]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \encoded_fu_58[61]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(37)
    );
\encoded_fu_58[38]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(38)
    );
\encoded_fu_58[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAABAA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(39)
    );
\encoded_fu_58[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(3),
      I1 => \encoded_fu_58[59]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(3)
    );
\encoded_fu_58[40]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(40)
    );
\encoded_fu_58[41]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(9),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(41)
    );
\encoded_fu_58[42]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(10),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(42)
    );
\encoded_fu_58[43]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(11),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(43)
    );
\encoded_fu_58[44]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(12),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(44)
    );
\encoded_fu_58[45]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(13),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(45)
    );
\encoded_fu_58[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA2AAAAAAAEAAAA"
    )
        port map (
      I0 => \^q\(14),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => \encoded_fu_58[63]_i_6_n_3\,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(46)
    );
\encoded_fu_58[47]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA2AAAAAAAEAAAA"
    )
        port map (
      I0 => \^q\(15),
      I1 => i_fu_62_reg(4),
      I2 => i_fu_62_reg(3),
      I3 => \encoded_fu_58[63]_i_6_n_3\,
      I4 => i_fu_62_reg(2),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(47)
    );
\encoded_fu_58[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(16),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(48)
    );
\encoded_fu_58[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(17),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(49)
    );
\encoded_fu_58[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(4),
      I1 => \encoded_fu_58[61]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(4)
    );
\encoded_fu_58[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(18),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(50)
    );
\encoded_fu_58[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(19),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(51)
    );
\encoded_fu_58[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(20),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(52)
    );
\encoded_fu_58[53]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA3AAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(21),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(53)
    );
\encoded_fu_58[54]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AAAAAAABAAAAAA"
    )
        port map (
      I0 => \^q\(22),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(54)
    );
\encoded_fu_58[55]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AAAAAAABAAAAAA"
    )
        port map (
      I0 => \^q\(23),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(55)
    );
\encoded_fu_58[56]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(24),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(56)
    );
\encoded_fu_58[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(25),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(57)
    );
\encoded_fu_58[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(26),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(58)
    );
\encoded_fu_58[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(27),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[59]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(59)
    );
\encoded_fu_58[59]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => i_fu_62_reg(1),
      I1 => i_fu_62_reg(0),
      O => \encoded_fu_58[59]_i_2_n_3\
    );
\encoded_fu_58[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(5),
      I1 => \encoded_fu_58[61]_i_2_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(5)
    );
\encoded_fu_58[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(28),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(60)
    );
\encoded_fu_58[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(29),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => \encoded_fu_58[61]_i_2_n_3\,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(61)
    );
\encoded_fu_58[61]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => i_fu_62_reg(0),
      I1 => i_fu_62_reg(1),
      O => \encoded_fu_58[61]_i_2_n_3\
    );
\encoded_fu_58[62]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFF10000000"
    )
        port map (
      I0 => \encoded_fu_58[62]_i_2_n_3\,
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \^q\(30),
      O => encoded_1_fu_247_p4(62)
    );
\encoded_fu_58[62]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84747B847B8B847"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_n_3\,
      I1 => i_fu_62_reg(4),
      I2 => \empty_fu_66[0]_i_3_n_3\,
      I3 => \^empty_fu_66_reg[5]_0\(5),
      I4 => \encoded_fu_58[63]_i_7_n_3\,
      I5 => \^empty_fu_66_reg[5]_0\(0),
      O => \encoded_fu_58[62]_i_2_n_3\
    );
\encoded_fu_58[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA2"
    )
        port map (
      I0 => ap_enable_reg_pp0_iter1,
      I1 => i_fu_62_reg(5),
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(4),
      I5 => i_fu_62_reg(3),
      O => empty_fu_660
    );
\encoded_fu_58[63]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFF10000000"
    )
        port map (
      I0 => \encoded_fu_58[63]_i_5_n_3\,
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \^q\(31),
      O => encoded_1_fu_247_p4(63)
    );
\encoded_fu_58[63]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84747B847B8B847"
    )
        port map (
      I0 => \empty_fu_66[0]_i_4_n_3\,
      I1 => i_fu_62_reg(4),
      I2 => \empty_fu_66[0]_i_3_n_3\,
      I3 => \^empty_fu_66_reg[5]_0\(5),
      I4 => \encoded_fu_58[63]_i_7_n_3\,
      I5 => \^empty_fu_66_reg[5]_0\(4),
      O => \encoded_fu_58[63]_i_5_n_3\
    );
\encoded_fu_58[63]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => i_fu_62_reg(0),
      I1 => i_fu_62_reg(1),
      O => \encoded_fu_58[63]_i_6_n_3\
    );
\encoded_fu_58[63]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^empty_fu_66_reg[5]_0\(1),
      I1 => \^empty_fu_66_reg[5]_0\(2),
      O => \encoded_fu_58[63]_i_7_n_3\
    );
\encoded_fu_58[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(6),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[62]_i_2_n_3\,
      O => encoded_1_fu_247_p4(6)
    );
\encoded_fu_58[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAB"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(7),
      I1 => \encoded_fu_58[63]_i_6_n_3\,
      I2 => i_fu_62_reg(2),
      I3 => i_fu_62_reg(4),
      I4 => i_fu_62_reg(3),
      I5 => \encoded_fu_58[63]_i_5_n_3\,
      O => encoded_1_fu_247_p4(7)
    );
\encoded_fu_58[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(8),
      I1 => \encoded_fu_58[62]_i_2_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(8)
    );
\encoded_fu_58[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA3AAAA"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(9),
      I1 => \encoded_fu_58[63]_i_5_n_3\,
      I2 => flow_control_loop_pipe_sequential_init_U_n_9,
      I3 => i_fu_62_reg(3),
      I4 => i_fu_62_reg(2),
      I5 => i_fu_62_reg(4),
      O => encoded_1_fu_247_p4(9)
    );
\encoded_fu_58_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(0),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(0),
      R => ap_loop_init
    );
\encoded_fu_58_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(10),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(10),
      R => ap_loop_init
    );
\encoded_fu_58_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(11),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(11),
      R => ap_loop_init
    );
\encoded_fu_58_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(12),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(12),
      R => ap_loop_init
    );
\encoded_fu_58_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(13),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(13),
      R => ap_loop_init
    );
\encoded_fu_58_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(14),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(14),
      R => ap_loop_init
    );
\encoded_fu_58_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(15),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(15),
      R => ap_loop_init
    );
\encoded_fu_58_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(16),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(16),
      R => ap_loop_init
    );
\encoded_fu_58_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(17),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(17),
      R => ap_loop_init
    );
\encoded_fu_58_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(18),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(18),
      R => ap_loop_init
    );
\encoded_fu_58_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(19),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(19),
      R => ap_loop_init
    );
\encoded_fu_58_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(1),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(1),
      R => ap_loop_init
    );
\encoded_fu_58_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(20),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(20),
      R => ap_loop_init
    );
\encoded_fu_58_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(21),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(21),
      R => ap_loop_init
    );
\encoded_fu_58_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(22),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(22),
      R => ap_loop_init
    );
\encoded_fu_58_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(23),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(23),
      R => ap_loop_init
    );
\encoded_fu_58_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(24),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(24),
      R => ap_loop_init
    );
\encoded_fu_58_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(25),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(25),
      R => ap_loop_init
    );
\encoded_fu_58_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(26),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(26),
      R => ap_loop_init
    );
\encoded_fu_58_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(27),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(27),
      R => ap_loop_init
    );
\encoded_fu_58_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(28),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(28),
      R => ap_loop_init
    );
\encoded_fu_58_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(29),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(29),
      R => ap_loop_init
    );
\encoded_fu_58_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(2),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(2),
      R => ap_loop_init
    );
\encoded_fu_58_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(30),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(30),
      R => ap_loop_init
    );
\encoded_fu_58_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(31),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(31),
      R => ap_loop_init
    );
\encoded_fu_58_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(32),
      Q => \^q\(0),
      R => ap_loop_init
    );
\encoded_fu_58_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(33),
      Q => \^q\(1),
      R => ap_loop_init
    );
\encoded_fu_58_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(34),
      Q => \^q\(2),
      R => ap_loop_init
    );
\encoded_fu_58_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(35),
      Q => \^q\(3),
      R => ap_loop_init
    );
\encoded_fu_58_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(36),
      Q => \^q\(4),
      R => ap_loop_init
    );
\encoded_fu_58_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(37),
      Q => \^q\(5),
      R => ap_loop_init
    );
\encoded_fu_58_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(38),
      Q => \^q\(6),
      R => ap_loop_init
    );
\encoded_fu_58_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(39),
      Q => \^q\(7),
      R => ap_loop_init
    );
\encoded_fu_58_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(3),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(3),
      R => ap_loop_init
    );
\encoded_fu_58_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(40),
      Q => \^q\(8),
      R => ap_loop_init
    );
\encoded_fu_58_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(41),
      Q => \^q\(9),
      R => ap_loop_init
    );
\encoded_fu_58_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(42),
      Q => \^q\(10),
      R => ap_loop_init
    );
\encoded_fu_58_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(43),
      Q => \^q\(11),
      R => ap_loop_init
    );
\encoded_fu_58_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(44),
      Q => \^q\(12),
      R => ap_loop_init
    );
\encoded_fu_58_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(45),
      Q => \^q\(13),
      R => ap_loop_init
    );
\encoded_fu_58_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(46),
      Q => \^q\(14),
      R => ap_loop_init
    );
\encoded_fu_58_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(47),
      Q => \^q\(15),
      R => ap_loop_init
    );
\encoded_fu_58_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(48),
      Q => \^q\(16),
      R => ap_loop_init
    );
\encoded_fu_58_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(49),
      Q => \^q\(17),
      R => ap_loop_init
    );
\encoded_fu_58_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(4),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(4),
      R => ap_loop_init
    );
\encoded_fu_58_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(50),
      Q => \^q\(18),
      R => ap_loop_init
    );
\encoded_fu_58_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(51),
      Q => \^q\(19),
      R => ap_loop_init
    );
\encoded_fu_58_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(52),
      Q => \^q\(20),
      R => ap_loop_init
    );
\encoded_fu_58_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(53),
      Q => \^q\(21),
      R => ap_loop_init
    );
\encoded_fu_58_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(54),
      Q => \^q\(22),
      R => ap_loop_init
    );
\encoded_fu_58_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(55),
      Q => \^q\(23),
      R => ap_loop_init
    );
\encoded_fu_58_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(56),
      Q => \^q\(24),
      R => ap_loop_init
    );
\encoded_fu_58_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(57),
      Q => \^q\(25),
      R => ap_loop_init
    );
\encoded_fu_58_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(58),
      Q => \^q\(26),
      R => ap_loop_init
    );
\encoded_fu_58_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(59),
      Q => \^q\(27),
      R => ap_loop_init
    );
\encoded_fu_58_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(5),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(5),
      R => ap_loop_init
    );
\encoded_fu_58_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(60),
      Q => \^q\(28),
      R => ap_loop_init
    );
\encoded_fu_58_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(61),
      Q => \^q\(29),
      R => ap_loop_init
    );
\encoded_fu_58_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(62),
      Q => \^q\(30),
      R => ap_loop_init
    );
\encoded_fu_58_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(63),
      Q => \^q\(31),
      R => ap_loop_init
    );
\encoded_fu_58_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(6),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(6),
      R => ap_loop_init
    );
\encoded_fu_58_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(7),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(7),
      R => ap_loop_init
    );
\encoded_fu_58_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(8),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(8),
      R => ap_loop_init
    );
\encoded_fu_58_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => encoded_1_fu_247_p4(9),
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(9),
      R => ap_loop_init
    );
flow_control_loop_pipe_sequential_init_U: entity work.bd_0_hls_inst_0_convEncoder_Seq_flow_control_loop_pipe_sequential_init
     port map (
      D(1 downto 0) => D(1 downto 0),
      E(0) => flow_control_loop_pipe_sequential_init_U_n_4,
      Q(5 downto 0) => i_fu_62_reg(5 downto 0),
      SR(0) => SR(0),
      \ap_CS_fsm_reg[2]\(2 downto 0) => \m_axis_TDATA[31]\(2 downto 0),
      ap_clk => ap_clk,
      ap_enable_reg_pp0_iter1 => ap_enable_reg_pp0_iter1,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \empty_fu_66_reg[0]\(0) => empty_fu_660,
      \empty_fu_66_reg[0]_0\ => \empty_fu_66_reg[0]_i_2_n_3\,
      \empty_fu_66_reg[5]\(5 downto 0) => \empty_fu_66_reg[5]_1\(5 downto 0),
      \empty_fu_66_reg[5]_0\(4 downto 0) => \^empty_fu_66_reg[5]_0\(4 downto 0),
      grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready,
      grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg(0) => ap_loop_init,
      \i_fu_62_reg[0]\ => flow_control_loop_pipe_sequential_init_U_n_9,
      m_axis_TREADY => m_axis_TREADY,
      s_axis_TREADY => s_axis_TREADY,
      s_axis_TVALID => s_axis_TVALID,
      \state_reg[5]\(5) => flow_control_loop_pipe_sequential_init_U_n_10,
      \state_reg[5]\(4) => flow_control_loop_pipe_sequential_init_U_n_11,
      \state_reg[5]\(3) => flow_control_loop_pipe_sequential_init_U_n_12,
      \state_reg[5]\(2) => flow_control_loop_pipe_sequential_init_U_n_13,
      \state_reg[5]\(1) => flow_control_loop_pipe_sequential_init_U_n_14,
      \state_reg[5]\(0) => flow_control_loop_pipe_sequential_init_U_n_15
    );
grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D555C000"
    )
        port map (
      I0 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_ready,
      I1 => \m_axis_TDATA[31]\(0),
      I2 => ap_start,
      I3 => s_axis_TVALID,
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      O => \ap_CS_fsm_reg[0]\
    );
\i_fu_62[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_fu_62_reg(0),
      O => \i_fu_62[0]_i_1_n_3\
    );
\i_fu_62[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => i_fu_62_reg(0),
      I1 => i_fu_62_reg(1),
      O => i_2_fu_120_p2(1)
    );
\i_fu_62[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => i_fu_62_reg(2),
      I1 => i_fu_62_reg(1),
      I2 => i_fu_62_reg(0),
      O => \i_fu_62[2]_i_1_n_3\
    );
\i_fu_62[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => i_fu_62_reg(3),
      I1 => i_fu_62_reg(0),
      I2 => i_fu_62_reg(1),
      I3 => i_fu_62_reg(2),
      O => i_2_fu_120_p2(3)
    );
\i_fu_62[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => i_fu_62_reg(4),
      I1 => i_fu_62_reg(0),
      I2 => i_fu_62_reg(1),
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(3),
      O => i_2_fu_120_p2(4)
    );
\i_fu_62[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => i_fu_62_reg(5),
      I1 => i_fu_62_reg(3),
      I2 => i_fu_62_reg(4),
      I3 => i_fu_62_reg(2),
      I4 => i_fu_62_reg(1),
      I5 => i_fu_62_reg(0),
      O => i_2_fu_120_p2(5)
    );
\i_fu_62_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => \i_fu_62[0]_i_1_n_3\,
      Q => i_fu_62_reg(0),
      R => ap_loop_init
    );
\i_fu_62_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => i_2_fu_120_p2(1),
      Q => i_fu_62_reg(1),
      R => ap_loop_init
    );
\i_fu_62_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => \i_fu_62[2]_i_1_n_3\,
      Q => i_fu_62_reg(2),
      R => ap_loop_init
    );
\i_fu_62_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => i_2_fu_120_p2(3),
      Q => i_fu_62_reg(3),
      R => ap_loop_init
    );
\i_fu_62_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => i_2_fu_120_p2(4),
      Q => i_fu_62_reg(4),
      R => ap_loop_init
    );
\i_fu_62_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => empty_fu_660,
      D => i_2_fu_120_p2(5),
      Q => i_fu_62_reg(5),
      R => ap_loop_init
    );
\m_axis_TDATA[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(0),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(0),
      O => m_axis_TDATA(0)
    );
\m_axis_TDATA[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(10),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(10),
      O => m_axis_TDATA(10)
    );
\m_axis_TDATA[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(11),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(11),
      O => m_axis_TDATA(11)
    );
\m_axis_TDATA[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(12),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(12),
      O => m_axis_TDATA(12)
    );
\m_axis_TDATA[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(13),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(13),
      O => m_axis_TDATA(13)
    );
\m_axis_TDATA[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(14),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(14),
      O => m_axis_TDATA(14)
    );
\m_axis_TDATA[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(15),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(15),
      O => m_axis_TDATA(15)
    );
\m_axis_TDATA[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(16),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(16),
      O => m_axis_TDATA(16)
    );
\m_axis_TDATA[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(17),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(17),
      O => m_axis_TDATA(17)
    );
\m_axis_TDATA[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(18),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(18),
      O => m_axis_TDATA(18)
    );
\m_axis_TDATA[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(19),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(19),
      O => m_axis_TDATA(19)
    );
\m_axis_TDATA[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(1),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(1),
      O => m_axis_TDATA(1)
    );
\m_axis_TDATA[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(20),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(20),
      O => m_axis_TDATA(20)
    );
\m_axis_TDATA[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(21),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(21),
      O => m_axis_TDATA(21)
    );
\m_axis_TDATA[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(22),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(22),
      O => m_axis_TDATA(22)
    );
\m_axis_TDATA[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(23),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(23),
      O => m_axis_TDATA(23)
    );
\m_axis_TDATA[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(24),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(24),
      O => m_axis_TDATA(24)
    );
\m_axis_TDATA[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(25),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(25),
      O => m_axis_TDATA(25)
    );
\m_axis_TDATA[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(26),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(26),
      O => m_axis_TDATA(26)
    );
\m_axis_TDATA[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(27),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(27),
      O => m_axis_TDATA(27)
    );
\m_axis_TDATA[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(28),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(28),
      O => m_axis_TDATA(28)
    );
\m_axis_TDATA[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(29),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(29),
      O => m_axis_TDATA(29)
    );
\m_axis_TDATA[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(2),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(2),
      O => m_axis_TDATA(2)
    );
\m_axis_TDATA[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(30),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(30),
      O => m_axis_TDATA(30)
    );
\m_axis_TDATA[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(31),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(31),
      O => m_axis_TDATA(31)
    );
\m_axis_TDATA[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(3),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(3),
      O => m_axis_TDATA(3)
    );
\m_axis_TDATA[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(4),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(4),
      O => m_axis_TDATA(4)
    );
\m_axis_TDATA[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(5),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(5),
      O => m_axis_TDATA(5)
    );
\m_axis_TDATA[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(6),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(6),
      O => m_axis_TDATA(6)
    );
\m_axis_TDATA[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(7),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(7),
      O => m_axis_TDATA(7)
    );
\m_axis_TDATA[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(8),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(8),
      O => m_axis_TDATA(8)
    );
\m_axis_TDATA[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \m_axis_TDATA[31]_0\(9),
      I1 => tmp_reg_174(0),
      I2 => m_axis_TREADY,
      I3 => \m_axis_TDATA[31]\(3),
      I4 => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(9),
      O => m_axis_TDATA(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0_convEncoder_Seq is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    s_axis_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_TVALID : in STD_LOGIC;
    s_axis_TREADY : out STD_LOGIC;
    s_axis_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_TSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_TVALID : out STD_LOGIC;
    m_axis_TREADY : in STD_LOGIC;
    m_axis_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_0_hls_inst_0_convEncoder_Seq : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_0_hls_inst_0_convEncoder_Seq : entity is "convEncoder_Seq";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of bd_0_hls_inst_0_convEncoder_Seq : entity is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of bd_0_hls_inst_0_convEncoder_Seq : entity is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of bd_0_hls_inst_0_convEncoder_Seq : entity is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of bd_0_hls_inst_0_convEncoder_Seq : entity is "4'b1000";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0_convEncoder_Seq : entity is "yes";
end bd_0_hls_inst_0_convEncoder_Seq;

architecture STRUCTURE of bd_0_hls_inst_0_convEncoder_Seq is
  signal \<const0>\ : STD_LOGIC;
  signal \ap_CS_fsm[3]_i_3_n_3\ : STD_LOGIC;
  signal ap_CS_fsm_state1 : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_CS_fsm_state4 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^ap_ready\ : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal data1 : STD_LOGIC;
  signal data10 : STD_LOGIC;
  signal data11 : STD_LOGIC;
  signal data12 : STD_LOGIC;
  signal data13 : STD_LOGIC;
  signal data14 : STD_LOGIC;
  signal data15 : STD_LOGIC;
  signal data16 : STD_LOGIC;
  signal data17 : STD_LOGIC;
  signal data18 : STD_LOGIC;
  signal data19 : STD_LOGIC;
  signal data2 : STD_LOGIC;
  signal data20 : STD_LOGIC;
  signal data21 : STD_LOGIC;
  signal data22 : STD_LOGIC;
  signal data23 : STD_LOGIC;
  signal data24 : STD_LOGIC;
  signal data25 : STD_LOGIC;
  signal data26 : STD_LOGIC;
  signal data27 : STD_LOGIC;
  signal data28 : STD_LOGIC;
  signal data29 : STD_LOGIC;
  signal data3 : STD_LOGIC;
  signal data30 : STD_LOGIC;
  signal data31 : STD_LOGIC;
  signal data4 : STD_LOGIC;
  signal data5 : STD_LOGIC;
  signal data6 : STD_LOGIC;
  signal data7 : STD_LOGIC;
  signal data8 : STD_LOGIC;
  signal data9 : STD_LOGIC;
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg : STD_LOGIC;
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77 : STD_LOGIC;
  signal grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \in_word_data_reg_178_reg_n_3_[0]\ : STD_LOGIC;
  signal in_word_last_reg_183 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_s_reg_191 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal state0 : STD_LOGIC;
  signal tmp_reg_174 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ap_CS_fsm[3]_i_3\ : label is "soft_lutpair9";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of ap_ready_INST_0 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \m_axis_TLAST[0]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of m_axis_TVALID_INST_0 : label is "soft_lutpair8";
begin
  ap_done <= \^ap_ready\;
  ap_ready <= \^ap_ready\;
  m_axis_TKEEP(3) <= \<const0>\;
  m_axis_TKEEP(2) <= \<const0>\;
  m_axis_TKEEP(1) <= \<const0>\;
  m_axis_TKEEP(0) <= \<const0>\;
  m_axis_TSTRB(3) <= \<const0>\;
  m_axis_TSTRB(2) <= \<const0>\;
  m_axis_TSTRB(1) <= \<const0>\;
  m_axis_TSTRB(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D0FFD0D0"
    )
        port map (
      I0 => tmp_reg_174(0),
      I1 => m_axis_TREADY,
      I2 => ap_CS_fsm_state4,
      I3 => ap_start,
      I4 => ap_CS_fsm_state1,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F808F808F808FFFF"
    )
        port map (
      I0 => tmp_reg_174(0),
      I1 => ap_CS_fsm_state4,
      I2 => m_axis_TREADY,
      I3 => ap_CS_fsm_state3,
      I4 => s_axis_TVALID,
      I5 => \ap_CS_fsm[3]_i_3_n_3\,
      O => ap_NS_fsm(3)
    );
\ap_CS_fsm[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => ap_CS_fsm_state1,
      I1 => ap_start,
      O => \ap_CS_fsm[3]_i_3_n_3\
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => ap_CS_fsm_state1,
      S => ap_rst_n_inv
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => ap_CS_fsm_state3,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(3),
      Q => ap_CS_fsm_state4,
      R => ap_rst_n_inv
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ap_CS_fsm_state1,
      I1 => ap_start,
      O => ap_idle
    );
ap_ready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => ap_CS_fsm_state4,
      I1 => m_axis_TREADY,
      I2 => tmp_reg_174(0),
      O => \^ap_ready\
    );
grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115: entity work.bd_0_hls_inst_0_convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1
     port map (
      D(1 downto 0) => ap_NS_fsm(2 downto 1),
      Q(31 downto 0) => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(63 downto 32),
      SR(0) => ap_rst_n_inv,
      \ap_CS_fsm_reg[0]\ => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      \empty_fu_66[0]_i_4_0\(31) => data31,
      \empty_fu_66[0]_i_4_0\(30) => data30,
      \empty_fu_66[0]_i_4_0\(29) => data29,
      \empty_fu_66[0]_i_4_0\(28) => data28,
      \empty_fu_66[0]_i_4_0\(27) => data27,
      \empty_fu_66[0]_i_4_0\(26) => data26,
      \empty_fu_66[0]_i_4_0\(25) => data25,
      \empty_fu_66[0]_i_4_0\(24) => data24,
      \empty_fu_66[0]_i_4_0\(23) => data23,
      \empty_fu_66[0]_i_4_0\(22) => data22,
      \empty_fu_66[0]_i_4_0\(21) => data21,
      \empty_fu_66[0]_i_4_0\(20) => data20,
      \empty_fu_66[0]_i_4_0\(19) => data19,
      \empty_fu_66[0]_i_4_0\(18) => data18,
      \empty_fu_66[0]_i_4_0\(17) => data17,
      \empty_fu_66[0]_i_4_0\(16) => data16,
      \empty_fu_66[0]_i_4_0\(15) => data15,
      \empty_fu_66[0]_i_4_0\(14) => data14,
      \empty_fu_66[0]_i_4_0\(13) => data13,
      \empty_fu_66[0]_i_4_0\(12) => data12,
      \empty_fu_66[0]_i_4_0\(11) => data11,
      \empty_fu_66[0]_i_4_0\(10) => data10,
      \empty_fu_66[0]_i_4_0\(9) => data9,
      \empty_fu_66[0]_i_4_0\(8) => data8,
      \empty_fu_66[0]_i_4_0\(7) => data7,
      \empty_fu_66[0]_i_4_0\(6) => data6,
      \empty_fu_66[0]_i_4_0\(5) => data5,
      \empty_fu_66[0]_i_4_0\(4) => data4,
      \empty_fu_66[0]_i_4_0\(3) => data3,
      \empty_fu_66[0]_i_4_0\(2) => data2,
      \empty_fu_66[0]_i_4_0\(1) => data1,
      \empty_fu_66[0]_i_4_0\(0) => \in_word_data_reg_178_reg_n_3_[0]\,
      \empty_fu_66_reg[5]_0\(5 downto 0) => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(5 downto 0),
      \empty_fu_66_reg[5]_1\(5 downto 0) => state(5 downto 0),
      grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      m_axis_TDATA(31 downto 0) => m_axis_TDATA(31 downto 0),
      \m_axis_TDATA[31]\(3) => ap_CS_fsm_state4,
      \m_axis_TDATA[31]\(2) => ap_CS_fsm_state3,
      \m_axis_TDATA[31]\(1) => ap_CS_fsm_state2,
      \m_axis_TDATA[31]\(0) => ap_CS_fsm_state1,
      \m_axis_TDATA[31]_0\(31 downto 0) => p_s_reg_191(31 downto 0),
      m_axis_TREADY => m_axis_TREADY,
      s_axis_TREADY => s_axis_TREADY,
      s_axis_TVALID => s_axis_TVALID,
      tmp_reg_174(0) => tmp_reg_174(0)
    );
grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_n_77,
      Q => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_ap_start_reg,
      R => ap_rst_n_inv
    );
\in_word_data_reg_178_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(0),
      Q => \in_word_data_reg_178_reg_n_3_[0]\,
      R => '0'
    );
\in_word_data_reg_178_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(10),
      Q => data10,
      R => '0'
    );
\in_word_data_reg_178_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(11),
      Q => data11,
      R => '0'
    );
\in_word_data_reg_178_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(12),
      Q => data12,
      R => '0'
    );
\in_word_data_reg_178_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(13),
      Q => data13,
      R => '0'
    );
\in_word_data_reg_178_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(14),
      Q => data14,
      R => '0'
    );
\in_word_data_reg_178_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(15),
      Q => data15,
      R => '0'
    );
\in_word_data_reg_178_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(16),
      Q => data16,
      R => '0'
    );
\in_word_data_reg_178_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(17),
      Q => data17,
      R => '0'
    );
\in_word_data_reg_178_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(18),
      Q => data18,
      R => '0'
    );
\in_word_data_reg_178_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(19),
      Q => data19,
      R => '0'
    );
\in_word_data_reg_178_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(1),
      Q => data1,
      R => '0'
    );
\in_word_data_reg_178_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(20),
      Q => data20,
      R => '0'
    );
\in_word_data_reg_178_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(21),
      Q => data21,
      R => '0'
    );
\in_word_data_reg_178_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(22),
      Q => data22,
      R => '0'
    );
\in_word_data_reg_178_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(23),
      Q => data23,
      R => '0'
    );
\in_word_data_reg_178_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(24),
      Q => data24,
      R => '0'
    );
\in_word_data_reg_178_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(25),
      Q => data25,
      R => '0'
    );
\in_word_data_reg_178_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(26),
      Q => data26,
      R => '0'
    );
\in_word_data_reg_178_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(27),
      Q => data27,
      R => '0'
    );
\in_word_data_reg_178_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(28),
      Q => data28,
      R => '0'
    );
\in_word_data_reg_178_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(29),
      Q => data29,
      R => '0'
    );
\in_word_data_reg_178_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(2),
      Q => data2,
      R => '0'
    );
\in_word_data_reg_178_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(30),
      Q => data30,
      R => '0'
    );
\in_word_data_reg_178_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(31),
      Q => data31,
      R => '0'
    );
\in_word_data_reg_178_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(3),
      Q => data3,
      R => '0'
    );
\in_word_data_reg_178_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(4),
      Q => data4,
      R => '0'
    );
\in_word_data_reg_178_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(5),
      Q => data5,
      R => '0'
    );
\in_word_data_reg_178_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(6),
      Q => data6,
      R => '0'
    );
\in_word_data_reg_178_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(7),
      Q => data7,
      R => '0'
    );
\in_word_data_reg_178_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(8),
      Q => data8,
      R => '0'
    );
\in_word_data_reg_178_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TDATA(9),
      Q => data9,
      R => '0'
    );
\in_word_last_reg_183_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TLAST(0),
      Q => in_word_last_reg_183(0),
      R => '0'
    );
\m_axis_TLAST[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => in_word_last_reg_183(0),
      I1 => ap_CS_fsm_state4,
      I2 => m_axis_TREADY,
      I3 => tmp_reg_174(0),
      O => m_axis_TLAST(0)
    );
m_axis_TVALID_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F800"
    )
        port map (
      I0 => ap_CS_fsm_state4,
      I1 => tmp_reg_174(0),
      I2 => ap_CS_fsm_state3,
      I3 => m_axis_TREADY,
      O => m_axis_TVALID
    );
\p_s_reg_191_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(32),
      Q => p_s_reg_191(0),
      R => '0'
    );
\p_s_reg_191_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(42),
      Q => p_s_reg_191(10),
      R => '0'
    );
\p_s_reg_191_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(43),
      Q => p_s_reg_191(11),
      R => '0'
    );
\p_s_reg_191_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(44),
      Q => p_s_reg_191(12),
      R => '0'
    );
\p_s_reg_191_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(45),
      Q => p_s_reg_191(13),
      R => '0'
    );
\p_s_reg_191_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(46),
      Q => p_s_reg_191(14),
      R => '0'
    );
\p_s_reg_191_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(47),
      Q => p_s_reg_191(15),
      R => '0'
    );
\p_s_reg_191_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(48),
      Q => p_s_reg_191(16),
      R => '0'
    );
\p_s_reg_191_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(49),
      Q => p_s_reg_191(17),
      R => '0'
    );
\p_s_reg_191_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(50),
      Q => p_s_reg_191(18),
      R => '0'
    );
\p_s_reg_191_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(51),
      Q => p_s_reg_191(19),
      R => '0'
    );
\p_s_reg_191_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(33),
      Q => p_s_reg_191(1),
      R => '0'
    );
\p_s_reg_191_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(52),
      Q => p_s_reg_191(20),
      R => '0'
    );
\p_s_reg_191_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(53),
      Q => p_s_reg_191(21),
      R => '0'
    );
\p_s_reg_191_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(54),
      Q => p_s_reg_191(22),
      R => '0'
    );
\p_s_reg_191_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(55),
      Q => p_s_reg_191(23),
      R => '0'
    );
\p_s_reg_191_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(56),
      Q => p_s_reg_191(24),
      R => '0'
    );
\p_s_reg_191_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(57),
      Q => p_s_reg_191(25),
      R => '0'
    );
\p_s_reg_191_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(58),
      Q => p_s_reg_191(26),
      R => '0'
    );
\p_s_reg_191_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(59),
      Q => p_s_reg_191(27),
      R => '0'
    );
\p_s_reg_191_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(60),
      Q => p_s_reg_191(28),
      R => '0'
    );
\p_s_reg_191_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(61),
      Q => p_s_reg_191(29),
      R => '0'
    );
\p_s_reg_191_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(34),
      Q => p_s_reg_191(2),
      R => '0'
    );
\p_s_reg_191_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(62),
      Q => p_s_reg_191(30),
      R => '0'
    );
\p_s_reg_191_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(63),
      Q => p_s_reg_191(31),
      R => '0'
    );
\p_s_reg_191_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(35),
      Q => p_s_reg_191(3),
      R => '0'
    );
\p_s_reg_191_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(36),
      Q => p_s_reg_191(4),
      R => '0'
    );
\p_s_reg_191_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(37),
      Q => p_s_reg_191(5),
      R => '0'
    );
\p_s_reg_191_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(38),
      Q => p_s_reg_191(6),
      R => '0'
    );
\p_s_reg_191_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(39),
      Q => p_s_reg_191(7),
      R => '0'
    );
\p_s_reg_191_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(40),
      Q => p_s_reg_191(8),
      R => '0'
    );
\p_s_reg_191_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state3,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_encoded_out(41),
      Q => p_s_reg_191(9),
      R => '0'
    );
\state[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => tmp_reg_174(0),
      I1 => m_axis_TREADY,
      I2 => ap_CS_fsm_state4,
      O => state0
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(0),
      Q => state(0),
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(1),
      Q => state(1),
      R => '0'
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(2),
      Q => state(2),
      R => '0'
    );
\state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(3),
      Q => state(3),
      R => '0'
    );
\state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(4),
      Q => state(4),
      R => '0'
    );
\state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => state0,
      D => grp_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1_fu_115_p_out(5),
      Q => state(5),
      R => '0'
    );
\tmp_reg_174_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state1,
      D => s_axis_TVALID,
      Q => tmp_reg_174(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_hls_inst_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_start : in STD_LOGIC;
    s_axis_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_TREADY : out STD_LOGIC;
    s_axis_TSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_TVALID : in STD_LOGIC;
    m_axis_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_TREADY : in STD_LOGIC;
    m_axis_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_TVALID : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bd_0_hls_inst_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bd_0_hls_inst_0 : entity is "bd_0_hls_inst_0,convEncoder_Seq,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_0_hls_inst_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of bd_0_hls_inst_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bd_0_hls_inst_0 : entity is "convEncoder_Seq,Vivado 2025.2";
  attribute hls_module : string;
  attribute hls_module of bd_0_hls_inst_0 : entity is "yes";
end bd_0_hls_inst_0;

architecture STRUCTURE of bd_0_hls_inst_0 is
  signal \<const1>\ : STD_LOGIC;
  signal NLW_inst_m_axis_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axis_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of inst : label is "4'b1000";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of ap_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axis:m_axis, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_MODE of ap_done : signal is "slave";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_MODE of ap_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of m_axis_TREADY : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute X_INTERFACE_INFO of m_axis_TVALID : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_TREADY : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_TVALID : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_TDATA : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_MODE of m_axis_TDATA : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_TDATA : signal is "XIL_INTERFACENAME m_axis, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_TKEEP : signal is "xilinx.com:interface:axis:1.0 m_axis TKEEP";
  attribute X_INTERFACE_INFO of m_axis_TLAST : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_TSTRB : signal is "xilinx.com:interface:axis:1.0 m_axis TSTRB";
  attribute X_INTERFACE_INFO of s_axis_TDATA : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_MODE of s_axis_TDATA : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_TDATA : signal is "XIL_INTERFACENAME s_axis, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_TKEEP : signal is "xilinx.com:interface:axis:1.0 s_axis TKEEP";
  attribute X_INTERFACE_INFO of s_axis_TLAST : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_TSTRB : signal is "xilinx.com:interface:axis:1.0 s_axis TSTRB";
begin
  m_axis_TKEEP(3) <= \<const1>\;
  m_axis_TKEEP(2) <= \<const1>\;
  m_axis_TKEEP(1) <= \<const1>\;
  m_axis_TKEEP(0) <= \<const1>\;
  m_axis_TSTRB(3) <= \<const1>\;
  m_axis_TSTRB(2) <= \<const1>\;
  m_axis_TSTRB(1) <= \<const1>\;
  m_axis_TSTRB(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.bd_0_hls_inst_0_convEncoder_Seq
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      m_axis_TDATA(31 downto 0) => m_axis_TDATA(31 downto 0),
      m_axis_TKEEP(3 downto 0) => NLW_inst_m_axis_TKEEP_UNCONNECTED(3 downto 0),
      m_axis_TLAST(0) => m_axis_TLAST(0),
      m_axis_TREADY => m_axis_TREADY,
      m_axis_TSTRB(3 downto 0) => NLW_inst_m_axis_TSTRB_UNCONNECTED(3 downto 0),
      m_axis_TVALID => m_axis_TVALID,
      s_axis_TDATA(31 downto 0) => s_axis_TDATA(31 downto 0),
      s_axis_TKEEP(3 downto 0) => B"0000",
      s_axis_TLAST(0) => s_axis_TLAST(0),
      s_axis_TREADY => s_axis_TREADY,
      s_axis_TSTRB(3 downto 0) => B"0000",
      s_axis_TVALID => s_axis_TVALID
    );
end STRUCTURE;
