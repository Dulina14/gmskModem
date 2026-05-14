//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef CONVENCODER_SEQ_SUBSYSTEM_MONITOR_SV
`define CONVENCODER_SEQ_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_master_s_axis)
`uvm_analysis_imp_decl(_svr_slave_m_axis)

class convEncoder_Seq_subsystem_monitor extends uvm_component;

    convEncoder_Seq_reference_model refm;
    convEncoder_Seq_scoreboard scbd;

    `uvm_component_utils_begin(convEncoder_Seq_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_master_s_axis#(svr_pkg::svr_transfer#(41), convEncoder_Seq_subsystem_monitor) svr_master_s_axis_imp;
    uvm_analysis_imp_svr_slave_m_axis#(svr_pkg::svr_transfer#(41), convEncoder_Seq_subsystem_monitor) svr_slave_m_axis_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(convEncoder_Seq_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = convEncoder_Seq_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_master_s_axis_imp = new("svr_master_s_axis_imp", this);
        svr_slave_m_axis_imp = new("svr_slave_m_axis_imp", this);
    endfunction

    virtual function void write_svr_master_s_axis(svr_transfer#(41) tr);
        refm.write_svr_master_s_axis(tr);
        scbd.write_svr_master_s_axis(tr);
    endfunction

    virtual function void write_svr_slave_m_axis(svr_transfer#(41) tr);
        refm.write_svr_slave_m_axis(tr);
        scbd.write_svr_slave_m_axis(tr);
    endfunction
endclass
`endif
