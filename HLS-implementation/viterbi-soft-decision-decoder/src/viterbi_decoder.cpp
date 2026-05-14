/**
 * =============================================================================
 * viterbi_decoder.cpp
 * =============================================================================
 * HLS Viterbi Decoder — TRACEBACK ARCHITECTURE
 *
 *
 *   Block 1 ─ Branch Metric Unit (BMU)
 *   Block 2 ─ Add-Compare-Select (ACS) × 64 (fully parallel)
 *   Block 3 ─ Survivor Memory  survivor[TRACEBACK_LEN][NUM_STATES]
 *   Block 4 ─ Minimum Path-Metric Finder
 *   Block 5 ─ Traceback Unit
 *
 * ── Hardware mapping ──────────────────────────────────────────────────────────
 *
 *  ┌─────────────┐     ┌──────────────────────────────────────────────────┐
 *  │  AXI-Stream │────▶│  Input register (word32_t encoded_word)          │
 *  │  encoded_in │     └────────────────────┬─────────────────────────────┘
 *  └─────────────┘                          │ symbol extraction (16 × 2-bit)
 *                                           ▼
 *  ┌────────────────────────────────────────────────────────────────────────┐
 *  │  TRELLIS PIPELINE  (16 cycles, II=1)                                   │
 *  │                                                                        │
 *  │  ┌────────┐  ┌───────────────────────────────────────────────────┐    │
 *  │  │  Path  │  │  ACS Unit × 64  (fully unrolled = combinational)  │    │
 *  │  │ Metric │  │                                                   │    │
 *  │  │ File   │  │  For each next-state ns (0…63):                  │    │
 *  │  │ pm[64] │  │    ┌─────────┐  branch  ┌─────────┐             │    │
 *  │  │        │◀─┤    │  BMU 0  │◀─metric──│ pred0   │             │    │
 *  │  │ (fully │  │    │ hamming │          │ encoder │             │    │
 *  │  │ parti- │  │    │  dist   │          │  out    │             │    │
 *  │  │ tioned)│  │    └────┬────┘          └─────────┘             │    │
 *  │  └────────┘  │         │  ADD  →  total0                       │    │
 *  │              │    ┌────┴────┐                                   │    │
 *  │              │    │COMPARE  │──────── survivor[t][ns] ──────▶ │    │
 *  │              │    │SELECT   │                                   │    │
 *  │              │    └────┬────┘                                   │    │
 *  │              │         │  ADD  →  total1                       │    │
 *  │              │    ┌────┴────┐          ┌─────────┐             │    │
 *  │              │    │  BMU 1  │◀─metric──│ pred1   │             │    │
 *  │              │    │ hamming │          │ encoder │             │    │
 *  │              │    │  dist   │          │  out    │             │    │
 *  │              │    └─────────┘          └─────────┘             │    │
 *  │              └───────────────────────────────────────────────────┘    │
 *  └────────────────────────────────────────────────────────────────────────┘
 *                                           │
 *                                           ▼
 *  ┌────────────────────┐       ┌───────────────────────┐
 *  │  Min-Metric Finder │       │  Survivor Memory      │
 *  │  (64-way tree)     │       │  [32][64]             │
 *  └────────┬───────────┘       └──────────┬────────────┘
 *           │ best_state                   │
 *           └────────────┬─────────────────┘
 *                        ▼
 *  ┌───────────────────────────────────┐
 *  │  Traceback Unit  (16 steps seq.)  │
 *  │  decoded_bit[t] = cur_state[5]    │
 *  │  prev_state = (cs[4:0]<<1)|surv   │
 *  └────────────────┬──────────────────┘
 *                   ▼
 *  ┌─────────────┐
 *  │  AXI-Stream │
 *  │ decoded_out │
 *  └─────────────┘
 *
 * ── State transition (K=7, rate 1/2) ─────────────────────────────────────────
 *
 *   shift register  reg[6:0] = { in_bit, state[5:0] }
 *   next_state                = { in_bit, state[5:1] }
 *                             = (in_bit << 5) | (state >> 1)
 *
 *   out0 = XOR of reg tapped by G0 (0x79 = 1111001)
 *   out1 = XOR of reg tapped by G1 (0x5B = 1011011)
 *   encoded_symbol = { out0, out1 }
 *
 * ── Predecessor relationship (used in ACS) ────────────────────────────────────
 *
 *   For a given next_state ns:
 *     in_bit = ns[5]                        (recovered from ns directly)
 *     pred0  = (ns[4:0] << 1) | 0           (predecessor with LSB=0)
 *     pred1  = (ns[4:0] << 1) | 1           (predecessor with LSB=1)
 *
 * ── Traceback bit recovery ────────────────────────────────────────────────────
 *
 *   The decoded input bit at trellis stage t equals cur_state[5], because
 *   next_state[5] was set to in_bit during the forward pass.
 *   The survivor bit restores the LSB of the predecessor:
 *     prev_state = (cur_state[4:0] << 1) | survivor[t][cur_state]
 *
 * =============================================================================
 */

#include "../include/viterbi_decoder.h"
#include "../include/bmu.h"


// =============================================================================
// ── TOP-LEVEL FUNCTION ────────────────────────────────────────────────────────
// =============================================================================

void viterbi_decoder(
    hls::stream<word32_t> &encoded_in,
    hls::stream<word32_t> &decoded_out)
{
    // ── AXI-Stream port configuration ────────────────────────────────────────
#pragma HLS INTERFACE axis port = encoded_in
#pragma HLS INTERFACE axis port = decoded_out
#pragma HLS INTERFACE ap_ctrl_none port = return

    // =========================================================================
    // ── INTERNAL STATE STORAGE ───────────────────────────────────────────────
    // =========================================================================

    /**
     * Path Metric File — pm[s]
     *
     * Holds the accumulated Hamming distance (best-path cost) for each of
     * the 64 encoder states.  Initialised to INF for all states except
     * state 0 (the known encoder start state).
     *
     * ARRAY_PARTITION complete: all 64 metrics live in separate registers so
     * that all 64 ACS units can read/write in parallel without memory port
     * conflicts — mandatory for II=1 on the TRELLIS loop.
     */
    metric_t pm[NUM_STATES];
    metric_t pm_next[NUM_STATES];
#pragma HLS ARRAY_PARTITION variable = pm complete dim = 1
#pragma HLS ARRAY_PARTITION variable = pm_next complete dim = 1

    /**
     * Survivor Memory — survivor[t][s]
     *
     * For each trellis stage t and next-state s:
     *   0 → predecessor was pred0 = (s[4:0] << 1) | 0
     *   1 → predecessor was pred1 = (s[4:0] << 1) | 1
     *
     * Dimensions: [TRACEBACK_LEN=32][NUM_STATES=64]
     *
     * ARRAY_PARTITION complete on dim=2 (the state dimension):
     *   - All 64 survivor bits for a given stage are stored in separate
     *     memories, enabling 64 simultaneous writes per trellis cycle.
     *   - During traceback a 64:1 mux selects the one bit needed.
     */
    ap_uint<1> survivor[TRACEBACK_LEN][NUM_STATES];
#pragma HLS ARRAY_PARTITION variable = survivor complete dim = 2

    /**
     * Pre-extracted received symbols — rx_sym[t]
     *
     * Unrolled extraction ensures each slot is addressed by a compile-time
     * constant inside the TRELLIS pipeline loop, avoiding a barrel-shifter
     * on the critical path.
     */
    symbol_t rx_sym[NUM_SYMBOLS];
#pragma HLS ARRAY_PARTITION variable = rx_sym complete dim = 1

    // =========================================================================
    // ── STEP 1 : READ ENCODED INPUT WORD FROM AXI-STREAM ─────────────────────
    // =========================================================================
    word32_t encoded_word = encoded_in.read();

// =========================================================================
// ── STEP 2 : EXTRACT ALL 16 RECEIVED SYMBOLS ─────────────────────────────
//
//  Packing convention (MSB-first):
//    encoded_word[31:30] = symbol 0 (first in time)
//    encoded_word[29:28] = symbol 1
//    ...
//    encoded_word[ 1: 0] = symbol 15 (last in time)
//
//  With UNROLL the loop index is constant at each instance, so each
//  bit-slice uses a compile-time constant — no mux, no shifter.
// =========================================================================
EXTRACT_SYMS:
    for (int t = 0; t < NUM_SYMBOLS; t++)
    {
#pragma HLS UNROLL
        // Shift right by (30 - 2t) and mask to 2 bits.
        // At t=0 → shift 30, at t=15 → shift 0.
        rx_sym[t] = (symbol_t)((encoded_word >> (30 - 2 * t)) & (word32_t)0x3);
    }

// =========================================================================
// ── STEP 3 : INITIALISE PATH METRICS ─────────────────────────────────────
// =========================================================================

INIT_PM:
    for (int s = 0; s < NUM_STATES; s++)
    {
#pragma HLS UNROLL
        pm[s] = (s == 0) ? (metric_t)0 : METRIC_INF;
    }

// =========================================================================
// ── STEP 4 : TRELLIS PROCESSING (16 stages) ──────────────────────────────
// =========================================================================
TRELLIS:
    for (int t = 0; t < NUM_SYMBOLS; t++)
    {
#pragma HLS PIPELINE II = 1

        symbol_t sym = rx_sym[t]; // Received symbol for this stage

    // =====================================================================
    // ── BLOCK 2 : ACS UNITS (64 units, fully parallel) ───────────────────
    // =====================================================================

    ACS:
        for (int ns = 0; ns < NUM_STATES; ns++)
        {
#pragma HLS UNROLL

            ap_uint<6> ns_u = (ap_uint<6>)ns;
            ap_uint<1> in_bit = ns_u[5];                                                // recovered input bit
            ap_uint<5> ns_lo5 = (ap_uint<5>)(ns_u(4, 0));                               // ns[4:0]
            ap_uint<6> pred0 = (ap_uint<6>)((ap_uint<6>)ns_lo5 << 1);                   // pred LSB=0
            ap_uint<6> pred1 = (ap_uint<6>)(((ap_uint<6>)ns_lo5 << 1) | (ap_uint<6>)1); // pred LSB=1

            // -----------------------------------------------------------------
            // BLOCK 1 — BRANCH METRIC UNIT (BMU)
            // -----------------------------------------------------------------
            symbol_t exp0 = encoder_output(pred0, in_bit);
            symbol_t exp1 = encoder_output(pred1, in_bit);
            ap_uint<2> bm0 = hamming2(sym, exp0);
            ap_uint<2> bm1 = hamming2(sym, exp1);

            // -----------------------------------------------------------------
            // ADD — Accumulated path metric + branch metric
            //
            // Use 9-bit arithmetic to detect overflow, then saturate.
            // Saturation prevents wrap-around from polluting the comparison.
            // -----------------------------------------------------------------
            ap_uint<9> acc0 = (ap_uint<9>)pm[pred0] + (ap_uint<9>)bm0;
            ap_uint<9> acc1 = (ap_uint<9>)pm[pred1] + (ap_uint<9>)bm1;

            // Saturate at 0xFF (METRIC_INF) to avoid wrap-around
            metric_t total0 = (acc0 > (ap_uint<9>)0xFF) ? (metric_t)0xFF : (metric_t)acc0;
            metric_t total1 = (acc1 > (ap_uint<9>)0xFF) ? (metric_t)0xFF : (metric_t)acc1;

            // -----------------------------------------------------------------
            // COMPARE-SELECT — Choose the survivor path
            //
            // If pred0's accumulated metric is ≤ pred1's, select pred0.
            // Store the binary decision in survivor memory.
            //
            // BLOCK 3 — SURVIVOR MEMORY write (one bit per state per stage)
            // -----------------------------------------------------------------
            if (total0 <= total1)
            {
                pm_next[ns] = total0;
                survivor[t][ns] = (ap_uint<1>)0; // pred0 survived
            }
            else
            {
                pm_next[ns] = total1;
                survivor[t][ns] = (ap_uint<1>)1; // pred1 survived
            }

        } // end ACS (unrolled over 64 states)

    // Commit updated path metrics for the next trellis stage.
    // All 64 copies execute in parallel (fully partitioned arrays).
    COPY_PM:
        for (int s = 0; s < NUM_STATES; s++)
        {
#pragma HLS UNROLL
            pm[s] = pm_next[s];
        }

    } // end TRELLIS (pipelined, II=1)

    // =========================================================================
    // ── STEP 5 : MINIMUM PATH-METRIC FINDER ──────────────────────────────────
    //  Implemented as a linear scan; HLS unrolls it into a comparator tree
    //  (log2(64) = 6 levels deep) for fast combinational evaluation.
    // =========================================================================
    state_t best_state = (state_t)0;
    metric_t best_metric = pm[0];

MIN_FIND:
    for (int s = 1; s < NUM_STATES; s++)
    {
#pragma HLS UNROLL
        if (pm[s] < best_metric)
        {
            best_metric = pm[s];
            best_state = (state_t)s;
        }
    }

    // =========================================================================
    // ── STEP 6 : TRACEBACK ──────────────────────────────────────────────────
    // =========================================================================

    // Temporary storage for recovered bits (variable-index write is safe here)
    ap_uint<1> decoded_arr[NUM_SYMBOLS];
#pragma HLS ARRAY_PARTITION variable = decoded_arr complete dim = 1

    state_t cur_state = best_state;

TRACEBACK:
    for (int t = NUM_SYMBOLS - 1; t >= 0; t--)
    {
        // Recovered input bit = MSB (bit 5) of the next-state we arrived at.
        // At the first iteration cur_state is the final state (t = NUM_SYMBOLS-1
        // transition), at the last iteration it is the state after stage 0.
        decoded_arr[t] = cur_state[5];

        // Read the survivor decision stored during the forward ACS pass.
        // survivor[t][cur_state] = 0 → predecessor was pred0 (LSB=0)
        //                        = 1 → predecessor was pred1 (LSB=1)
        ap_uint<1> surv = survivor[t][cur_state];

        // Reconstruct the predecessor state:
        //   prev[5:1] = cur_state[4:0]   (upper bits slide right)
        //   prev[0]   = surv             (LSB restored from survivor memory)
        ap_uint<5> cur_lo5 = (ap_uint<5>)(cur_state(4, 0));
        cur_state = (state_t)(((ap_uint<6>)cur_lo5 << 1) | (ap_uint<6>)surv);
    }

    // =========================================================================
    // ── STEP 7 : PACK DECODED BITS AND WRITE TO AXI-STREAM ──────────────────
    // =========================================================================
    word32_t decoded_word = 0;
PACK_OUT:
    for (int t = 0; t < NUM_SYMBOLS; t++)
    {
#pragma HLS UNROLL
        decoded_word[t] = decoded_arr[t];
    }

    decoded_out.write(decoded_word);
}
