set SynModuleInfo {
  {SRCNAME convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 MODELNAME convEncoder_Seq_Pipeline_VITIS_LOOP_40_1 RTLNAME convEncoder_Seq_convEncoder_Seq_Pipeline_VITIS_LOOP_40_1
    SUBMODULES {
      {MODELNAME convEncoder_Seq_bitselect_1ns_32ns_5ns_1_1_1 RTLNAME convEncoder_Seq_bitselect_1ns_32ns_5ns_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME convEncoder_Seq_partset_64ns_64ns_2ns_6ns_64_1_1 RTLNAME convEncoder_Seq_partset_64ns_64ns_2ns_6ns_64_1_1 BINDTYPE op TYPE partset IMPL auto}
      {MODELNAME convEncoder_Seq_flow_control_loop_pipe_sequential_init RTLNAME convEncoder_Seq_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME convEncoder_Seq_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME convEncoder_Seq MODELNAME convEncoder_Seq RTLNAME convEncoder_Seq IS_TOP 1}
}
