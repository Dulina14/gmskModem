## 125 MHz clock on Zybo Z7 K17
set_property PACKAGE_PIN L16 [get_ports ap_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ap_clk]
create_clock -period 8.000 -name ap_clk [get_ports ap_clk]

## Reset
set_property PACKAGE_PIN T16 [get_ports ap_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports ap_rst_n]

## Measurement done output
set_property PACKAGE_PIN D18 [get_ports measurement_done]
set_property IOSTANDARD LVCMOS33 [get_ports measurement_done]






create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ap_clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {bits_q[0]} {bits_q[1]} {bits_q[2]} {bits_q[3]} {bits_q[4]} {bits_q[5]} {bits_q[6]} {bits_q[7]} {bits_q[8]} {bits_q[9]} {bits_q[10]} {bits_q[11]} {bits_q[12]} {bits_q[13]} {bits_q[14]} {bits_q[15]} {bits_q[16]} {bits_q[17]} {bits_q[18]} {bits_q[19]} {bits_q[20]} {bits_q[21]} {bits_q[22]} {bits_q[23]} {bits_q[24]} {bits_q[25]} {bits_q[26]} {bits_q[27]} {bits_q[28]} {bits_q[29]} {bits_q[30]} {bits_q[31]} {bits_q[32]} {bits_q[33]} {bits_q[34]} {bits_q[35]} {bits_q[36]} {bits_q[37]} {bits_q[38]} {bits_q[39]} {bits_q[40]} {bits_q[41]} {bits_q[42]} {bits_q[43]} {bits_q[44]} {bits_q[45]} {bits_q[46]} {bits_q[47]} {bits_q[48]} {bits_q[49]} {bits_q[50]} {bits_q[51]} {bits_q[52]} {bits_q[53]} {bits_q[54]} {bits_q[55]} {bits_q[56]} {bits_q[57]} {bits_q[58]} {bits_q[59]} {bits_q[60]} {bits_q[61]} {bits_q[62]} {bits_q[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {state_q[0]} {state_q[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 64 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {cycs_q[0]} {cycs_q[1]} {cycs_q[2]} {cycs_q[3]} {cycs_q[4]} {cycs_q[5]} {cycs_q[6]} {cycs_q[7]} {cycs_q[8]} {cycs_q[9]} {cycs_q[10]} {cycs_q[11]} {cycs_q[12]} {cycs_q[13]} {cycs_q[14]} {cycs_q[15]} {cycs_q[16]} {cycs_q[17]} {cycs_q[18]} {cycs_q[19]} {cycs_q[20]} {cycs_q[21]} {cycs_q[22]} {cycs_q[23]} {cycs_q[24]} {cycs_q[25]} {cycs_q[26]} {cycs_q[27]} {cycs_q[28]} {cycs_q[29]} {cycs_q[30]} {cycs_q[31]} {cycs_q[32]} {cycs_q[33]} {cycs_q[34]} {cycs_q[35]} {cycs_q[36]} {cycs_q[37]} {cycs_q[38]} {cycs_q[39]} {cycs_q[40]} {cycs_q[41]} {cycs_q[42]} {cycs_q[43]} {cycs_q[44]} {cycs_q[45]} {cycs_q[46]} {cycs_q[47]} {cycs_q[48]} {cycs_q[49]} {cycs_q[50]} {cycs_q[51]} {cycs_q[52]} {cycs_q[53]} {cycs_q[54]} {cycs_q[55]} {cycs_q[56]} {cycs_q[57]} {cycs_q[58]} {cycs_q[59]} {cycs_q[60]} {cycs_q[61]} {cycs_q[62]} {cycs_q[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {enc_m_TDATA[0]} {enc_m_TDATA[1]} {enc_m_TDATA[2]} {enc_m_TDATA[3]} {enc_m_TDATA[4]} {enc_m_TDATA[5]} {enc_m_TDATA[6]} {enc_m_TDATA[7]} {enc_m_TDATA[8]} {enc_m_TDATA[9]} {enc_m_TDATA[10]} {enc_m_TDATA[11]} {enc_m_TDATA[12]} {enc_m_TDATA[13]} {enc_m_TDATA[14]} {enc_m_TDATA[15]} {enc_m_TDATA[16]} {enc_m_TDATA[17]} {enc_m_TDATA[18]} {enc_m_TDATA[19]} {enc_m_TDATA[20]} {enc_m_TDATA[21]} {enc_m_TDATA[22]} {enc_m_TDATA[23]} {enc_m_TDATA[24]} {enc_m_TDATA[25]} {enc_m_TDATA[26]} {enc_m_TDATA[27]} {enc_m_TDATA[28]} {enc_m_TDATA[29]} {enc_m_TDATA[30]} {enc_m_TDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {enc_s_TDATA[0]} {enc_s_TDATA[1]} {enc_s_TDATA[2]} {enc_s_TDATA[3]} {enc_s_TDATA[4]} {enc_s_TDATA[5]} {enc_s_TDATA[6]} {enc_s_TDATA[7]} {enc_s_TDATA[8]} {enc_s_TDATA[9]} {enc_s_TDATA[10]} {enc_s_TDATA[11]} {enc_s_TDATA[12]} {enc_s_TDATA[13]} {enc_s_TDATA[14]} {enc_s_TDATA[15]} {enc_s_TDATA[16]} {enc_s_TDATA[17]} {enc_s_TDATA[18]} {enc_s_TDATA[19]} {enc_s_TDATA[20]} {enc_s_TDATA[21]} {enc_s_TDATA[22]} {enc_s_TDATA[23]} {enc_s_TDATA[24]} {enc_s_TDATA[25]} {enc_s_TDATA[26]} {enc_s_TDATA[27]} {enc_s_TDATA[28]} {enc_s_TDATA[29]} {enc_s_TDATA[30]} {enc_s_TDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list dec_TREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list dec_TVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list enc_m_TLAST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list enc_m_TREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list enc_m_TVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list enc_s_TLAST]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list enc_s_TREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list enc_s_TVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list measurement_done_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets ap_clk_IBUF_BUFG]
