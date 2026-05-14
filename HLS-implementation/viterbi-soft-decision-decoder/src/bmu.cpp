#include "../include/bmu.h"


ap_uint<1> parity7(ap_uint<7> x)
{
#pragma HLS INLINE
    // Level 1: four 2-input XORs
    ap_uint<1> l1_0 = x[0] ^ x[1];
    ap_uint<1> l1_1 = x[2] ^ x[3];
    ap_uint<1> l1_2 = x[4] ^ x[5];
    ap_uint<1> l1_3 = x[6];
    // Level 2: two 2-input XORs
    ap_uint<1> l2_0 = l1_0 ^ l1_1;
    ap_uint<1> l2_1 = l1_2 ^ l1_3;
    // Level 3: final XOR
    return l2_0 ^ l2_1;
}



symbol_t encoder_output(ap_uint<6> state, ap_uint<1> in_bit)
{
#pragma HLS INLINE
    // Assemble 7-bit shift register: MSB = in_bit, LSBs = state
    ap_uint<7> reg = ((ap_uint<7>)in_bit << 6) | (ap_uint<7>)state;

    // Apply generator polynomials
    ap_uint<1> out0 = parity7((ap_uint<7>)(reg & G0_POLY)); // G0 = 0x79
    ap_uint<1> out1 = parity7((ap_uint<7>)(reg & G1_POLY)); // G1 = 0x5B

    // Pack into 2-bit symbol: MSB = out0, LSB = out1
    return (symbol_t)(((ap_uint<2>)out0 << 1) | (ap_uint<2>)out1);
}


ap_uint<2> hamming2(symbol_t a, symbol_t b)
{
#pragma HLS INLINE
    ap_uint<2> diff = a ^ b;
    return (ap_uint<2>)((ap_uint<2>)diff[0] + (ap_uint<2>)diff[1]);
}