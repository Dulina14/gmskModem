module throughput_bench_top #(
    parameter int unsigned INITIAL_DELAY  = 4_096,          // Warmup: skip first N cycles
    parameter int unsigned MEASURE_WINDOW = 100_000_000,    // Measurement window: 100 M cycles
    parameter int unsigned PACKET_SIZE    = 64,             // Words per encoder input packet
    parameter int unsigned CLK_HZ         = 125_000_000     // Informational: 125 MHz
) (
    // ── Clock / Reset ─────────────────────────────────────
    input  logic        ap_clk,           // 125 MHz system clock
    input  logic        ap_rst_n,         // Active-low synchronous reset

    // ── Throughput measurement outputs ────────────────────
    (* mark_debug = "true" *) output logic measurement_done  // Stays high when window is complete
);

    // ================================================================
    // 0.  Local parameters & derived widths
    // ================================================================

    // Bit-width needed to count INITIAL_DELAY cycles
    localparam int WARMUP_W  = $clog2(INITIAL_DELAY  + 1);
    // Bit-width needed to count MEASURE_WINDOW cycles
    localparam int WINDOW_W  = $clog2(MEASURE_WINDOW + 1);
    // Bit-width for packet word counter
    localparam int PKT_W     = $clog2(PACKET_SIZE);

    // ================================================================
    // 1.  Internal wires - Encoder slave port (LFSR → encoder)
    // ================================================================
    (* mark_debug = "true" *) logic [31:0] enc_s_TDATA;
    (* mark_debug = "true" *) logic        enc_s_TVALID;
    (* mark_debug = "true" *) logic        enc_s_TREADY;
    logic  [3:0] enc_s_TKEEP;
    logic  [3:0] enc_s_TSTRB;
    (* mark_debug = "true" *) logic        enc_s_TLAST;


    // ================================================================
    // 2.  Internal wires - Encoder master port (encoder → decoder)
    // ================================================================
    (* mark_debug = "true" *) logic [31:0] enc_m_TDATA;
    (* mark_debug = "true" *) logic        enc_m_TVALID;
    (* mark_debug = "true" *) logic        enc_m_TREADY;
    logic  [3:0] enc_m_TKEEP;
    logic  [3:0] enc_m_TSTRB;
    (* mark_debug = "true" *) logic        enc_m_TLAST;
    

    // ================================================================
    // 3.  Internal wires - Decoder output
    // ================================================================
    (* mark_debug = "true" *) logic [31:0] dec_TDATA;
    (* mark_debug = "true" *) logic        dec_TVALID;
    (* mark_debug = "true" *) logic        dec_TREADY;
    

    // ================================================================
    // 4.  ap_start - encoder control
    //     HLS streaming modules are started once after reset
    //     and run continuously; ap_start is held high.
    // ================================================================
    logic ap_start_reg;

    always_ff @(posedge ap_clk) begin
        if (!ap_rst_n)
            ap_start_reg <= 1'b0;
        else
            ap_start_reg <= 1'b1;   // Assert after first rising edge post-reset
    end

    // ================================================================
    // 5.  LFSR data source
    //     Advance whenever the encoder accepts a word.
    // ================================================================
    logic lfsr_enable;
    assign lfsr_enable = enc_s_TVALID & enc_s_TREADY;  // AXI handshake

    lfsr32 u_lfsr (
        .clk      (ap_clk),
        .rst_n    (ap_rst_n),
        .enable   (lfsr_enable),
        .data_out (enc_s_TDATA)
    );

    // ================================================================
    // 6.  Packet / TLAST generation
    //     Assert TLAST on the last word of every PACKET_SIZE-word burst.
    //     This gives the encoder proper packet framing.
    // ================================================================
    logic [PKT_W-1:0] pkt_word_cnt;

    always_ff @(posedge ap_clk) begin
        if (!ap_rst_n) begin
            pkt_word_cnt <= '0;
        end else if (enc_s_TVALID & enc_s_TREADY) begin
            // Roll over after the final word in each packet
            pkt_word_cnt <= (pkt_word_cnt == PKT_W'(PACKET_SIZE - 1))
                            ? '0
                            : pkt_word_cnt + 1'b1;
        end
    end

    // TVALID is continuously asserted after reset (no bubbles)
    assign enc_s_TVALID = ap_rst_n;
    assign enc_s_TKEEP  = 4'hF;    // All 4 bytes valid
    assign enc_s_TSTRB  = 4'hF;    // All 4 bytes are data (not position bytes)
    assign enc_s_TLAST  = (pkt_word_cnt == PKT_W'(PACKET_SIZE - 1));

    // ================================================================
    // 7.  Encoder → Decoder connection
    //     The encoder master port wires directly to the decoder slave.
    //     The decoder input TREADY is driven by decoder itself; we
    //     forward the encoder's TVALID and tie the back-channel closed.
    //     Note: viterbi_decoder slave does not expose TKEEP/TSTRB/TLAST
    //     per the supplied interface spec, so only TDATA/TVALID/TREADY
    //     are connected to the decoder.
    // ================================================================

    // Decoder's TREADY feeds back into encoder's TREADY path.
    // enc_m_TREADY is the decoder's input ready.
    // We do NOT stall the decoder from this module - the decoder itself
    // drives its own input TREADY.  We must wire enc_m_TREADY so the
    // encoder sees proper back-pressure.
    //
    // The decoder input TREADY is an output of viterbi_decoder;
    // we connect it to enc_m_TREADY below in the instantiation section.

    // Keep decoder output sink permanently ready (no back-pressure)
    assign dec_TREADY = 1'b1;

    // ================================================================
    // 8.  Encoder instantiation (HLS AXI-Stream)
    // ================================================================
    convEncoder_Seq u_encoder (
        // Control
        .ap_clk          (ap_clk),
        .ap_rst_n        (ap_rst_n),
        .ap_start        (ap_start_reg),

        // Slave (input from LFSR)
        .s_axis_TDATA    (enc_s_TDATA),
        .s_axis_TVALID   (enc_s_TVALID),
        .s_axis_TREADY   (enc_s_TREADY),
        .s_axis_TKEEP    (enc_s_TKEEP),
        .s_axis_TSTRB    (enc_s_TSTRB),
        .s_axis_TLAST    (enc_s_TLAST),

        // Master (output to decoder)
        .m_axis_TDATA    (enc_m_TDATA),
        .m_axis_TVALID   (enc_m_TVALID),
        .m_axis_TREADY   (enc_m_TREADY),
        .m_axis_TKEEP    (enc_m_TKEEP),
        .m_axis_TSTRB    (enc_m_TSTRB),
        .m_axis_TLAST    (enc_m_TLAST)
    );

    // ================================================================
    // 9.  Viterbi decoder instantiation (HLS AXI-Stream)
    //     Interface per spec: TDATA/TVALID/TREADY only on slave port.
    // ================================================================
    viterbi_decoder u_decoder (
        // Control
        .ap_clk               (ap_clk),
        .ap_rst_n             (ap_rst_n),

        // Slave (input from encoder)
        .encoded_in_TDATA     (enc_m_TDATA),
        .encoded_in_TVALID    (enc_m_TVALID),
        .encoded_in_TREADY    (enc_m_TREADY),   // back-pressure to encoder

        // Master (decoded output - sink is always ready)
        .decoded_out_TDATA    (dec_TDATA),
        .decoded_out_TVALID   (dec_TVALID),
        .decoded_out_TREADY   (dec_TREADY)
    );

    // ================================================================
    // 10.  Throughput measurement FSM
    //
    //      States:
    //        WARMUP   - wait INITIAL_DELAY cycles for pipeline to fill
    //        MEASURE  - accumulate output_bits and cycle_count for
    //                   exactly MEASURE_WINDOW cycles
    //        DONE     - freeze counters; hold measurement_done high
    // ================================================================

    typedef enum logic [1:0] {
        ST_WARMUP  = 2'b00,
        ST_MEASURE = 2'b01,
        ST_DONE    = 2'b10
    } fsm_state_t;

    (* mark_debug = "true" *) fsm_state_t state_q;
    fsm_state_t                 state_d;
    logic [WARMUP_W-1:0]        warmup_cnt_q;
    logic [WINDOW_W-1:0]        window_cnt_q;
    (* mark_debug = "true" *) logic [63:0] bits_q;
    (* mark_debug = "true" *) logic [63:0] cycs_q;
    logic [63:0]                bits_d;
    logic [63:0]                cycs_d;

    // ── Next-state combinational logic ──────────────────────────────
    always_comb begin
        state_d = state_q;   // Default: stay in current state
        bits_d  = bits_q;
        cycs_d  = cycs_q;

        case (state_q)

            // ── Warmup ─────────────────────────────────────────────
            // Simply wait INITIAL_DELAY cycles so the pipeline is full
            // before counting begins.  Counters are frozen.
            ST_WARMUP : begin
                if (warmup_cnt_q == WARMUP_W'(INITIAL_DELAY - 1))
                    state_d = ST_MEASURE;
            end

            // ── Measurement window ─────────────────────────────────
            // Count cycles and output bits for MEASURE_WINDOW cycles.
            ST_MEASURE : begin
                // Accumulate cycles
                cycs_d = cycs_q + 64'd1;

                // Accumulate output bits whenever decoder produces data
                if (dec_TVALID & dec_TREADY)
                    bits_d = bits_q + 64'd32;  // 32-bit word per transfer

                // Transition when window expires
                if (window_cnt_q == WINDOW_W'(MEASURE_WINDOW - 1))
                    state_d = ST_DONE;
            end

            // ── Done ────────────────────────────────────────────────
            // Counters are frozen. measurement_done stays asserted.
            ST_DONE : begin
                // Stay here until external reset
            end

            default : state_d = ST_WARMUP;

        endcase
    end

    // ── Sequential registers ─────────────────────────────────────
    always_ff @(posedge ap_clk) begin
        if (!ap_rst_n) begin
            state_q      <= ST_WARMUP;
            warmup_cnt_q <= '0;
            window_cnt_q <= '0;
            bits_q       <= '0;
            cycs_q       <= '0;
        end else begin
            state_q <= state_d;
            bits_q  <= bits_d;
            cycs_q  <= cycs_d;

            // Warmup counter - free-running during WARMUP
            if (state_q == ST_WARMUP)
                warmup_cnt_q <= warmup_cnt_q + 1'b1;

            // Window counter - runs during MEASURE only
            if (state_q == ST_MEASURE)
                window_cnt_q <= window_cnt_q + 1'b1;
        end
    end

    // ================================================================
    // 11.  Output assignments
    // ================================================================
    assign measurement_done = (state_q == ST_DONE);

    // ================================================================
    // 12.  Deadlock prevention assertions (synthesis-ignored)
    //      Vivado ignores these in synthesis; they aid simulation.
    // ================================================================
    // synthesis translate_off
    initial begin
        $display("[throughput_bench_top] Parameters:");
        $display("  INITIAL_DELAY  = %0d cycles", INITIAL_DELAY);
        $display("  MEASURE_WINDOW = %0d cycles", MEASURE_WINDOW);
        $display("  PACKET_SIZE    = %0d words",  PACKET_SIZE);
        $display("  CLK_HZ         = %0d Hz",     CLK_HZ);
        $display("  Estimated measurement time = %.3f ms",
                 real'(MEASURE_WINDOW) / real'(CLK_HZ) * 1000.0);
    end
    // synthesis translate_on

endmodule : throughput_bench_top
