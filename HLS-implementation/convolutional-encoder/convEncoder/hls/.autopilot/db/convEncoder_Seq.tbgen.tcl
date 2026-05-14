set moduleName convEncoder_Seq
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 4
set C_modelName {convEncoder_Seq}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_V_data_V int 32 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ s_axis_V_keep_V int 4 regular {axi_s 0 volatile  { s_axis Keep } }  }
	{ s_axis_V_strb_V int 4 regular {axi_s 0 volatile  { s_axis Strb } }  }
	{ s_axis_V_last_V int 1 regular {axi_s 0 volatile  { s_axis Last } }  }
	{ m_axis_V_data_V int 32 regular {axi_s 1 volatile  { m_axis Data } }  }
	{ m_axis_V_keep_V int 4 regular {axi_s 1 volatile  { m_axis Keep } }  }
	{ m_axis_V_strb_V int 4 regular {axi_s 1 volatile  { m_axis Strb } }  }
	{ m_axis_V_last_V int 1 regular {axi_s 1 volatile  { m_axis Last } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 3 } 
	{ s_axis_TKEEP sc_in sc_lv 4 signal 1 } 
	{ s_axis_TSTRB sc_in sc_lv 4 signal 2 } 
	{ s_axis_TLAST sc_in sc_lv 1 signal 3 } 
	{ m_axis_TDATA sc_out sc_lv 32 signal 4 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 7 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 4 } 
	{ m_axis_TKEEP sc_out sc_lv 4 signal 5 } 
	{ m_axis_TSTRB sc_out sc_lv 4 signal 6 } 
	{ m_axis_TLAST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_V_last_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	convEncoder_Seq {
		s_axis_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_strb_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_last_V {Type I LastRead 0 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 2}
		m_axis_V_strb_V {Type O LastRead -1 FirstWrite 2}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 2}
		state {Type IO LastRead -1 FirstWrite -1}}
	convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 {
		state_load {Type I LastRead 0 FirstWrite -1}
		in_word_data {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		encoded_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "37"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "38"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_V_data_V { axis {  { s_axis_TDATA in_data 0 32 }  { s_axis_TVALID in_vld 0 1 } } }
	s_axis_V_keep_V { axis {  { s_axis_TKEEP in_data 0 4 } } }
	s_axis_V_strb_V { axis {  { s_axis_TSTRB in_data 0 4 } } }
	s_axis_V_last_V { axis {  { s_axis_TREADY in_acc 1 1 }  { s_axis_TLAST in_data 0 1 } } }
	m_axis_V_data_V { axis {  { m_axis_TDATA out_data 1 32 }  { m_axis_TREADY out_acc 0 1 } } }
	m_axis_V_keep_V { axis {  { m_axis_TKEEP out_data 1 4 } } }
	m_axis_V_strb_V { axis {  { m_axis_TSTRB out_data 1 4 } } }
	m_axis_V_last_V { axis {  { m_axis_TVALID out_vld 1 1 }  { m_axis_TLAST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
