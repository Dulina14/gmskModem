//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CONVENCODER_SEQ_ENV__SV                                                                                   
    `define CONVENCODER_SEQ_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class convEncoder_Seq_env extends uvm_env;                                                                          
                                                                                                                    
        convEncoder_Seq_virtual_sequencer convEncoder_Seq_virtual_sqr;                                                      
        convEncoder_Seq_config convEncoder_Seq_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(41) env_master_svr_s_axis;
        svr_pkg::svr_env#(41) env_slave_svr_m_axis;
                                                                                                                    
        convEncoder_Seq_reference_model   refm;                                                                         
                                                                                                                    
        convEncoder_Seq_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(convEncoder_Seq_env)                                                                 
        `uvm_field_object (env_master_svr_s_axis,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_m_axis,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (convEncoder_Seq_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (convEncoder_Seq_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "convEncoder_Seq_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void convEncoder_Seq_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        convEncoder_Seq_cfg = convEncoder_Seq_config::type_id::create("convEncoder_Seq_cfg", this);                           
                                                                                                                    
        convEncoder_Seq_cfg.port_s_axis_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_s_axis  = svr_env#(41)::type_id::create("env_master_svr_s_axis", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_s_axis*", "cfg", convEncoder_Seq_cfg.port_s_axis_cfg);
        convEncoder_Seq_cfg.port_s_axis_cfg.prt_type = svr_pkg::AXIS;
        convEncoder_Seq_cfg.port_s_axis_cfg.is_active = svr_pkg::SVR_ACTIVE;
        convEncoder_Seq_cfg.port_s_axis_cfg.spec_cfg = svr_pkg::NORMAL;
        convEncoder_Seq_cfg.port_s_axis_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 
        convEncoder_Seq_cfg.port_m_axis_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_m_axis  = svr_env#(41)::type_id::create("env_slave_svr_m_axis", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_m_axis*", "cfg", convEncoder_Seq_cfg.port_m_axis_cfg);
        convEncoder_Seq_cfg.port_m_axis_cfg.prt_type = svr_pkg::AXIS;
        convEncoder_Seq_cfg.port_m_axis_cfg.is_active = svr_pkg::SVR_ACTIVE;
        convEncoder_Seq_cfg.port_m_axis_cfg.spec_cfg = svr_pkg::NORMAL;
        convEncoder_Seq_cfg.port_m_axis_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 



        refm = convEncoder_Seq_reference_model::type_id::create("refm", this);


        uvm_config_db#(convEncoder_Seq_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = convEncoder_Seq_subsystem_monitor::type_id::create("subsys_mon", this);


        convEncoder_Seq_virtual_sqr = convEncoder_Seq_virtual_sequencer::type_id::create("convEncoder_Seq_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void convEncoder_Seq_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        convEncoder_Seq_virtual_sqr.svr_port_s_axis_sqr = env_master_svr_s_axis.m_agt.sqr;
        env_master_svr_s_axis.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_s_axis_imp);
 
        convEncoder_Seq_virtual_sqr.svr_port_m_axis_sqr = env_slave_svr_m_axis.s_agt.sqr;
        env_slave_svr_m_axis.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_m_axis_imp);
 
        refm.convEncoder_Seq_cfg = convEncoder_Seq_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task convEncoder_Seq_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "convEncoder_Seq_env is running", UVM_LOW)
    endtask


`endif
