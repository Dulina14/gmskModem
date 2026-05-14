/**
 * =============================================================================
 * viterbi_decoder.h
 * =============================================================================
 * HLS Viterbi Decoder - Header File
 *
 * Standard    : Compatible with DVB-S / CCSDS / NASA convolutional codes
 * Code Rate   : 1/2
 * Constraint  : K = 7
 * Polynomials : g0 = 171 (octal) = 0x79 = 0b1111001
 *               g1 = 133 (octal) = 0x5B = 0b1011011
 * Architecture: Traceback (NOT register exchange)
 * Interface   : AXI-Stream (hls::stream<ap_uint<32>>)
 *
 * Target tool : Vivado HLS / Vitis HLS 2020.x+
 * =============================================================================
 */

#ifndef CONSTANTS_H
#define CONSTANTS_H

#include "ap_int.h"
#include "hls_stream.h"

// =============================================================================
// DECODER CONFIGURATION PARAMETERS
// =============================================================================

/** Constraint length of the convolutional code */
#define K 7

/**
 * Number of encoder states = 2^(K-1) = 64.
 * The encoder has K-1 = 6 memory elements.
 */
#define NUM_STATES 64

/**
 * Survivor memory depth.
 * Must be >= 5*K for reliable traceback (32 >> 5*7=35, kept at spec value).
 * NOTE: Only the first NUM_SYMBOLS rows are used in this implementation.
 */
#define TRACEBACK_LEN 32

/**
 * Number of encoded symbols processed per decoder invocation.
 * Input is 32 encoded bits → 16 two-bit symbols → 16 trellis stages.
 */
#define NUM_SYMBOLS 16

/**
 * Generator polynomial g0 = 171 octal.
 *   171 (oct) = 1*64 + 7*8 + 1 = 121 (dec) = 0b1111001
 *   Taps: reg[6], reg[5], reg[4], reg[3], reg[0]
 */
#define G0_POLY ((ap_uint<7>)0x79)

/**
 * Generator polynomial g1 = 133 octal.
 *   133 (oct) = 1*64 + 3*8 + 3 = 91 (dec) = 0b1011011
 *   Taps: reg[6], reg[4], reg[3], reg[1], reg[0]
 */
#define G1_POLY ((ap_uint<7>)0x5B)

/**
 * Infinity sentinel for path metric initialisation.
 * Non-zero initial states are set to 0xFF so they are
 * never selected unless the true state 0 path becomes
 * unavailable (e.g. unknown start state use-case).
 */
#define METRIC_INF ((metric_t)0xFF)

// =============================================================================
// TYPE ALIASES
// =============================================================================

/** Path metric type.
 *  Max accumulated Hamming distance = NUM_SYMBOLS * 2 = 32.
 *  8 bits (0-255) provides ample headroom + saturation room.
 */
typedef ap_uint<8> metric_t;

/** 6-bit trellis state index (0 … NUM_STATES-1) */
typedef ap_uint<6> state_t;

/** 2-bit encoded channel symbol */
typedef ap_uint<2> symbol_t;

/** 1-bit survivor decision */
typedef ap_uint<1> bit_t;

/** 32-bit AXI-Stream data word */
typedef ap_uint<32> word32_t;

#endif /* CONSTANTS_H */