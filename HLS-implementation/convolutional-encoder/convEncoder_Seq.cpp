#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"

typedef hls::axis<ap_uint<32>, 0, 0, 0> axis_32;

ap_uint<2> encode(ap_uint<1> bit, ap_uint<6> &state)
{
#pragma HLS INLINE
    ap_uint<1> g1 = bit ^ state[0] ^ state[1] ^ state[2] ^ state[5];
    ap_uint<1> g2 = bit ^ state[1] ^ state[2] ^ state[4] ^ state[5];

    state = ((state << 1) & ap_uint<6>(0x3F)) | ap_uint<6>(bit);

    return (g2, g1);
}

void convEncoder_Seq(
    hls::stream<axis_32> &s_axis,
    hls::stream<axis_32> &m_axis)
{
#pragma HLS INTERFACE axis port=s_axis register_mode=off  // NEW: disables input reg slice
#pragma HLS INTERFACE axis port=m_axis register_mode=off  // NEW: disables output reg slice
                                                          // Without this, HLS inserts
                                                          // regslice_both.v stages that
                                                          // delay output by 1 clock cycle
                                                          // past ap_done — causing co-sim
                                                          // to capture the previous
                                                          // transaction's result each time.

    static ap_uint<6> state = 0;

    if (!s_axis.empty())
    {
        axis_32 in_word = s_axis.read();
        ap_uint<32> data = in_word.data;

        ap_uint<64> encoded = 0;

        for (int i = 0; i < 32; i++)
        {
            ap_uint<1>  bit      = data[i];
            ap_uint<2>  out_bits = encode(bit, state);
            encoded.range(2*i+1, 2*i) = out_bits;
        }

        axis_32 out_word0;
        out_word0.data = encoded.range(31, 0);
        out_word0.keep = 0xF;
        out_word0.strb = 0xF;
        out_word0.last = 0;
        m_axis.write(out_word0);

        axis_32 out_word1;
        out_word1.data = encoded.range(63, 32);
        out_word1.keep = 0xF;
        out_word1.strb = 0xF;
        out_word1.last = in_word.last;
        m_axis.write(out_word1);
    }
}