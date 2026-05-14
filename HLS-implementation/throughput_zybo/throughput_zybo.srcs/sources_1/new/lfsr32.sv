// ============================================================
//  File    : lfsr32.sv
//  Project : FPGA Throughput Measurement Bench
//  Purpose : 32-bit Galois Linear Feedback Shift Register
//            Produces a maximal-length pseudo-random sequence
//            (period = 2^32 - 1) for continuous stimulus data.
//
//  Polynomial: x^32 + x^22 + x^2 + x + 1
//  Taps (0-indexed MSB-first): 31, 21, 1, 0
//  Feedback mask (Galois form): 32'h8020_0003
//
//  Reset value: non-zero seed (all-zero is illegal for LFSR)
//
//  Synthesis: Vivado 2022+, fully synchronous, no latches
// ============================================================

module lfsr32 (
    input  logic        clk,       // System clock
    input  logic        rst_n,     // Active-low synchronous reset
    input  logic        enable,    // Shift when high (AXI handshake)
    output logic [31:0] data_out   // Current LFSR value
);

    // --------------------------------------------------------
    // Galois LFSR feedback polynomial mask
    //   x^32 + x^22 + x^2 + x + 1
    //   Bit positions: 31, 21, 1, 0  (0 = LSB)
    //   In Galois form the feedback is XORed into tap positions
    //   whenever the output (bit 0) is 1.
    // --------------------------------------------------------
    localparam logic [31:0] POLY = 32'h8020_0003;

    // Non-zero seed is required; chosen arbitrarily
    localparam logic [31:0] SEED = 32'hDEAD_BEEF;

    logic [31:0] lfsr_q;

    // --------------------------------------------------------
    // Galois LFSR register
    //   Next state = right-shift by 1, then XOR with POLY
    //   if the outgoing LSB was 1.
    // --------------------------------------------------------
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            lfsr_q <= SEED;
        end else if (enable) begin
            // Galois feedback: shift right, conditionally XOR
            lfsr_q <= {1'b0, lfsr_q[31:1]} ^ (lfsr_q[0] ? POLY : 32'h0);
        end
    end

    assign data_out = lfsr_q;

endmodule : lfsr32
