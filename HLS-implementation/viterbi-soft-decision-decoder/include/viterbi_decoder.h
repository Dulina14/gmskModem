#ifndef VITERBI_DECODER_H
#define VITERBI_DECODER_H

#include "constants.h"
// =============================================================================
// TOP-LEVEL FUNCTION PROTOTYPE
// =============================================================================
/**
 * viterbi_decoder()
 *
 * Decodes one block of 32 encoded bits (16 symbols) using the
 * traceback Viterbi algorithm.
 *
 * @param encoded_in  AXI-Stream input.
 *                    One 32-bit word = 16 two-bit symbols packed MSB-first:
 *                      symbol[0]  → bits[31:30]
 *                      symbol[1]  → bits[29:28]
 *                      ...
 *                      symbol[15] → bits[1:0]
 *
 * @param decoded_out AXI-Stream output.
 *                    One 32-bit word; the 16 recovered information bits are
 *                    stored in bits[15:0] (decoded_bit[0] at bit[0], etc.).
 *                    Bits[31:16] are zero-padded.
 */
void viterbi_decoder(
    hls::stream<word32_t> &encoded_in,
    hls::stream<word32_t> &decoded_out);

#endif /* VITERBI_DECODER_H */
