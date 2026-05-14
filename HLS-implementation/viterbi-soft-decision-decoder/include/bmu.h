#ifndef BMU_H
#define BMU_H

#include "constants.h"

// =============================================================================
// ── BLOCK 1 — BRANCH METRIC UNIT (BMU) helpers ───────────────────────────────
// =============================================================================

/**
 * parity7()
 *
 * XOR-reduce a 7-bit value to a single parity bit.
 * Synthesises to a balanced 3-level XOR tree (7 inputs → 1 output).
 *
 * @param  x   7-bit input
 * @return     1-bit even-parity result
 */

ap_uint<1> parity7(ap_uint<7> x);

/**
 * encoder_output()
 *
 * ┌─────────────────────────────────────────────────────────────────┐
 * │                  CONVOLUTIONAL ENCODER (rate 1/2, K=7)          │
 * │                                                                 │
 * │  in_bit ──┬──────────────────────────────────────────────────▶  │
 * │           │  ┌──┐  ┌──┐  ┌──┐  ┌──┐  ┌──┐  ┌──┐              │
 * │           └─▶│D0│─▶│D1│─▶│D2│─▶│D3│─▶│D4│─▶│D5│              │
 * │              └──┘  └──┘  └──┘  └──┘  └──┘  └──┘              │
 * │  reg[6]=in   [5]   [4]   [3]   [2]   [1]   [0]=state[0]       │
 * │                                                                 │
 * │  out0 = reg & G0_POLY  →  XOR-reduce  (G0 = 0x79 = 1111001)   │
 * │  out1 = reg & G1_POLY  →  XOR-reduce  (G1 = 0x5B = 1011011)   │
 * └─────────────────────────────────────────────────────────────────┘
 *
 * @param  state    6-bit encoder memory  (state[5:0])
 * @param  in_bit   1-bit encoder input
 * @return          2-bit symbol { out0, out1 }
 */

symbol_t encoder_output(ap_uint<6> state, ap_uint<1> in_bit);

/**
 * hamming2()
 *
 * Compute the Hamming distance between two 2-bit symbols.
 * Hardware cost: one 2-bit XOR + one 1-bit full adder.
 *
 * @param  a, b   2-bit input symbols
 * @return        Hamming distance ∈ {0, 1, 2}
 */

ap_uint<2> hamming2(symbol_t a, symbol_t b);

#endif /* BMU_H */