/**
 * =============================================================================
 * viterbi_decoder_tb.cpp
 * =============================================================================
 * Complete Vitis HLS C-Simulation Testbench
 * for the Traceback Viterbi Decoder
 *
 * Decoder under test
 * ──────────────────
 *   Rate         : 1/2
 *   Constraint   : K = 7
 *   Polynomials  : g0 = 171 octal (0x79)  g1 = 133 octal (0x5B)
 *   States       : 64
 *   Architecture : Traceback
 *   Interface    : AXI-Stream  ap_uint<32>
 *
 * Test flow
 * ─────────
 *   STEP 1  Generate TEST_BITS random information bits
 *   STEP 2  Reference convolutional encoder -> encoded bitstream
 *   STEP 3  Save  input_bits.txt / encoded_bits.txt / reference_bits.txt
 *   STEP 4  Pack encoded bits into 32-bit words (16 symbols / word)
 *   STEP 5  Call viterbi_decoder() block by block
 *   STEP 6  Unpack decoded words -> decoded_bits.txt
 *   STEP 7  Compare decoded_bits.txt vs reference_bits.txt -> BER report
 *
 * File layout (one bit per line, '0' or '1')
 *   input_bits.txt     - TEST_BITS information bits
 *   encoded_bits.txt   - TEST_BITS * 2 encoded bits
 *   reference_bits.txt - TEST_BITS information bits (golden reference)
 *   decoded_bits.txt   - recovered bits written by the decoder under test
 *
 * =============================================================================
 * KNOWN LIMITATION: short-block tail effect
 * =============================================================================
 * The decoder processes SYMBOLS_PER_BLOCK=16 symbols per call (16 decoded
 * bits) and uses traceback length = 32.  The encoder shift register has
 * K-1 = 6 stages.  The last 6 decoded bits of every block have fewer future
 * observations available to the traceback path, so they are structurally
 * harder to decode correctly (higher BER in the "tail region").
 *
 * The BER report separates "core" bits (positions 0-9) from "tail" bits
 * (positions 10-15) so this effect is clearly visible.
 *
 * To eliminate tail errors entirely, append K-1=6 zero bits to the encoder
 * input for each block (tail-bit flushing) and increase the decoder block
 * size to 22 symbols.
 * =============================================================================
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

/* HLS / ap_uint headers ─ present in Vitis HLS simulation environment */
#include "ap_int.h"
#include "hls_stream.h"

/* Decoder under test ─ compile together with this testbench */
#include "../include/viterbi_decoder.h"
#include "../include/bmu.h"

/* ============================================================================
 * STEP 8 : CONFIGURATION CONSTANTS
 * ============================================================================ */

/* Total information bits to test.
 * Must be a multiple of SYMBOLS_PER_BLOCK (16) → 10000 / 16 = 625 blocks. */
#define TEST_BITS           10000

/* Decoded bits per decoder call = symbols per 32-bit AXI word. */
#define SYMBOLS_PER_BLOCK   16

/* Total decoder invocations. */
#define NUM_BLOCKS          (TEST_BITS / SYMBOLS_PER_BLOCK)

/* Convolutional encoder parameters */
#define ENC_K               7
#define ENC_G0              0x79        /* 171 octal */
#define ENC_G1              0x5B        /* 133 octal */
#define ENC_STATES          64
#define ENC_RATE_DENOM      2           /* rate = 1/2 */

/* Pseudo-random seed — change to reproduce a specific run */
#define RAND_SEED           42

/* File names */
#define FILE_INPUT          "./input_bits.txt"
#define FILE_ENCODED        "./encoded_bits.txt"
#define FILE_REFERENCE      "./reference_bits.txt"
#define FILE_DECODED        "./decoded_bits.txt"

typedef ap_uint<32> word32_t;

/* ============================================================================
 * HELPER: 7-bit XOR parity
 * ============================================================================ */

/**
 * parity7_ref()
 *
 * XOR-reduce the lowest 7 bits of x to a single parity bit.
 * Used by the software reference encoder to evaluate the generator polynomials.
 */
static inline int parity7_ref(int x)
{
    x &= 0x7F;
    x ^= (x >> 4);
    x ^= (x >> 2);
    x ^= (x >> 1);
    return (x & 1);
}

/* ============================================================================
 * STEP 2 : REFERENCE CONVOLUTIONAL ENCODER
 * ============================================================================
 *
 * Hardware diagram (K=7, rate 1/2):
 *
 *  in_bit --+---------------------------------------------> ...
 *           |  +---+  +---+  +---+  +---+  +---+  +---+
 *           +->| 6 |->| 5 |->| 4 |->| 3 |->| 2 |->| 1 |
 *              +---+  +---+  +---+  +---+  +---+  +---+
 *   reg[6]=in   [5]    [4]    [3]    [2]    [1]    [0]
 *
 *  out0 = XOR of reg tapped by G0 = 0x79 = 1111001
 *  out1 = XOR of reg tapped by G1 = 0x5B = 1011011
 *
 * Parameters
 * ----------
 *   in_bits    : array of n_bits information bits (values 0 or 1)
 *   out_bits   : output array of 2*n_bits encoded bits
 *                layout: out_bits[2t] = out0, out_bits[2t+1] = out1
 *   n_bits     : number of information bits to encode
 *   init_state : initial encoder state (use 0 for zero-state start)
 *
 * Returns the final encoder state (useful for block chaining).
 */
static int convolutional_encoder(
    const int *in_bits,
    int       *out_bits,
    int        n_bits,
    int        init_state)
{
    int state = init_state & (ENC_STATES - 1);   /* 6-bit register */

    for (int i = 0; i < n_bits; i++)
    {
        int b = in_bits[i] & 1;

        /* Assemble 7-bit shift register: MSB = current input, lower 6 = state */
        int reg = ((b << 6) | state) & 0x7F;

        /* Generator polynomial outputs */
        int out0 = parity7_ref(reg & ENC_G0);    /* g0 = 0111 1001 */
        int out1 = parity7_ref(reg & ENC_G1);    /* g1 = 0101 1011 */

        out_bits[2 * i    ] = out0;
        out_bits[2 * i + 1] = out1;

        /* Advance state: shift in b, discard the oldest bit */
        state = ((b << 5) | (state >> 1)) & (ENC_STATES - 1);
    }

    return state;
}

/* ============================================================================
 * STEP 1 + STEP 3 : GENERATE AND SAVE TEST VECTORS
 * ============================================================================
 *
 * 1. Fills in_bits[TEST_BITS] with pseudo-random 0/1 values.
 * 2. Runs the reference encoder -> enc_bits[TEST_BITS * 2].
 * 3. Writes three text files.
 *
 * Returns 0 on success, -1 on file error.
 */
static int generate_test_vectors(int *in_bits, int *enc_bits)
{
    srand(RAND_SEED);

    /* STEP 1 : Random information bits */
    printf("[GEN] Generating %d random information bits (seed=%d)...\n",
           TEST_BITS, RAND_SEED);
    for (int i = 0; i < TEST_BITS; i++)
        in_bits[i] = rand() & 1;

    /* STEP 2 : Reference encoder
     *
     * CRITICAL: The HLS decoder initialises its path metrics assuming the
     * encoder started in state 0 (the all-zeros state) at the beginning of
     * every 32-bit AXI word.  Therefore the reference encoder MUST also
     * reset its shift register to state 0 at the start of every block of
     * SYMBOLS_PER_BLOCK bits.
     *
     * Encoding all TEST_BITS bits in a single call would carry encoder state
     * across block boundaries.  From block 2 onward the encoder would start
     * in a non-zero state while the decoder always assumes state 0, causing
     * systematic decode failures (~40% BER) on every block except the first.
     *
     * Fix: call convolutional_encoder() once per block, always with
     * init_state = 0.  This is consistent with how a block-mode encoder
     * (e.g. DVB-S with tail-bit flushing) would operate.
     */
    printf("[ENC] Running reference convolutional encoder (per-block, init_state=0)...\n");
    for (int blk = 0; blk < NUM_BLOCKS; blk++)
    {
        const int *blk_in  = in_bits  + blk * SYMBOLS_PER_BLOCK;
        int       *blk_enc = enc_bits + blk * SYMBOLS_PER_BLOCK * ENC_RATE_DENOM;
        /* init_state=0: decoder always assumes the encoder started in state 0 */
        (void)convolutional_encoder(blk_in, blk_enc, SYMBOLS_PER_BLOCK, 0);
    }
    printf("[ENC] Done: %d bits -> %d encoded bits (%d blocks of %d)\n",
           TEST_BITS, TEST_BITS * ENC_RATE_DENOM, NUM_BLOCKS, SYMBOLS_PER_BLOCK);

    /* STEP 3a : input_bits.txt */
    {
        FILE *fp = fopen(FILE_INPUT, "w");
        if (!fp) { perror("[ERR] Cannot open " FILE_INPUT); return -1; }
        for (int i = 0; i < TEST_BITS; i++)
            fprintf(fp, "%d\n", in_bits[i]);
        fclose(fp);
        printf("[FILE] Written: %-22s (%d bits)\n", FILE_INPUT, TEST_BITS);
    }

    /* STEP 3b : encoded_bits.txt */
    {
        FILE *fp = fopen(FILE_ENCODED, "w");
        if (!fp) { perror("[ERR] Cannot open " FILE_ENCODED); return -1; }
        for (int i = 0; i < TEST_BITS * ENC_RATE_DENOM; i++)
            fprintf(fp, "%d\n", enc_bits[i]);
        fclose(fp);
        printf("[FILE] Written: %-22s (%d bits)\n",
               FILE_ENCODED, TEST_BITS * ENC_RATE_DENOM);
    }

    /* STEP 3c : reference_bits.txt (golden reference for final comparison) */
    {
        FILE *fp = fopen(FILE_REFERENCE, "w");
        if (!fp) { perror("[ERR] Cannot open " FILE_REFERENCE); return -1; }
        for (int i = 0; i < TEST_BITS; i++)
            fprintf(fp, "%d\n", in_bits[i]);
        fclose(fp);
        printf("[FILE] Written: %-22s (%d bits)\n", FILE_REFERENCE, TEST_BITS);
    }

    return 0;
}

/* ============================================================================
 * STEP 4 + STEP 5 + STEP 6 : RUN THE DECODER
 * ============================================================================
 *
 * Reads encoded_bits.txt, drives the HLS Viterbi decoder block-by-block
 * through its AXI-Stream interface, writes decoded_bits.txt.
 *
 * AXI word packing (encoder -> decoder input)
 * -------------------------------------------
 *   32-bit word = 16 symbols = 32 encoded bits, MSB-first:
 *     word[31:30] = symbol  0 (out0 at bit31, out1 at bit30)
 *     word[29:28] = symbol  1
 *     ...
 *     word[ 1: 0] = symbol 15
 *
 * AXI word unpacking (decoder output -> file)
 * -------------------------------------------
 *   32-bit word, bits [15:0] = 16 decoded bits:
 *     word[0]  = decoded bit for symbol 0
 *     word[1]  = decoded bit for symbol 1
 *     ...
 *     word[15] = decoded bit for symbol 15
 *
 * Returns 0 on success, -1 on file/decode error.
 */
static int run_decoder(void)
{
    FILE *fp_enc = fopen(FILE_ENCODED, "r");
    if (!fp_enc) { perror("[ERR] Cannot open " FILE_ENCODED); return -1; }

    FILE *fp_dec = fopen(FILE_DECODED, "w");
    if (!fp_dec)
    {
        fclose(fp_enc);
        perror("[ERR] Cannot open " FILE_DECODED);
        return -1;
    }

    printf("[DEC] Starting decoder: %d blocks x %d symbols/block...\n",
           NUM_BLOCKS, SYMBOLS_PER_BLOCK);

    int blocks_done = 0;

    for (int blk = 0; blk < NUM_BLOCKS; blk++)
    {
        /* ---- STEP 4 : Pack 32 encoded bits into one 32-bit AXI word -------- */
        /*
         * Read 16 symbols (32 encoded bits) from encoded_bits.txt.
         * Each symbol is 2 bits; pack MSB-first into a 32-bit word.
         *
         *   symbol t:  out0 at bit [31-2t]
         *              out1 at bit [30-2t]
         */
        word32_t encoded_word = 0;
        int read_ok = 1;

        for (int t = 0; t < SYMBOLS_PER_BLOCK; t++)
        {
            int out0, out1;
            if (fscanf(fp_enc, "%d\n%d\n", &out0, &out1) != 2)
            {
                printf("[WARN] Unexpected end of %s at block %d symbol %d\n",
                       FILE_ENCODED, blk, t);
                read_ok = 0;
                break;
            }
            int shift   = 30 - (2 * t);
            word32_t sym = (word32_t)((out0 & 1) << 1) |
                           (word32_t)(out1 & 1);
            encoded_word |= (sym << shift);
        }

        if (!read_ok) break;

        /* ---- STEP 5 : Push word into AXI-Stream and call the decoder ------- */
        hls::stream<word32_t> enc_stream("enc");
        hls::stream<word32_t> dec_stream("dec");

        enc_stream.write(encoded_word);

        viterbi_decoder(enc_stream, dec_stream);   /* <-- DUT CALL */

        /* ---- STEP 6 : Unpack decoded word and write to file ---------------- */
        /*
         * Decoder output word: decoded_bit[t] lives at bit position t (0..15).
         * Write each bit on a separate line to decoded_bits.txt.
         */
        word32_t decoded_word = dec_stream.read();

        for (int t = 0; t < SYMBOLS_PER_BLOCK; t++)
            fprintf(fp_dec, "%d\n", (int)((decoded_word >> t) & 1));

        blocks_done++;

        if ((blk + 1) % 100 == 0 || blk == NUM_BLOCKS - 1)
            printf("[DEC]   %4d / %d blocks complete\n", blk + 1, NUM_BLOCKS);
    }

    fclose(fp_enc);
    fclose(fp_dec);

    printf("[FILE] Written: %-22s (%d bits from %d blocks)\n",
           FILE_DECODED, blocks_done * SYMBOLS_PER_BLOCK, blocks_done);

    return (blocks_done == NUM_BLOCKS) ? 0 : -1;
}

/* ============================================================================
 * STEP 7 : COMPARE RESULTS AND PRINT BER REPORT
 * ============================================================================
 *
 * Reads reference_bits.txt and decoded_bits.txt line by line.
 * Counts errors overall, and separately for "core" (positions 0..9) and
 * "tail" (positions 10..15) within each block.
 *
 * Returns total number of bit errors (0 = perfect decode).
 */
static int compare_results(void)
{
    FILE *fp_ref = fopen(FILE_REFERENCE, "r");
    FILE *fp_dec = fopen(FILE_DECODED,   "r");

    if (!fp_ref) { perror("[ERR] Cannot open " FILE_REFERENCE); return -1; }
    if (!fp_dec)
    {
        fclose(fp_ref);
        perror("[ERR] Cannot open " FILE_DECODED);
        return -1;
    }

    long total        = 0;
    long errors       = 0;
    long core_bits    = 0;
    long core_errors  = 0;
    long tail_bits    = 0;
    long tail_errors  = 0;

    /* Last (K-1)=6 positions in each block are the "tail region" */
    const int TAIL_START = SYMBOLS_PER_BLOCK - (ENC_K - 1);   /* = 10 */

    int ref_bit, dec_bit;
    long bit_in_block = 0;

    while (fscanf(fp_ref, "%d", &ref_bit) == 1 &&
           fscanf(fp_dec, "%d", &dec_bit) == 1)
    {
        int err = (ref_bit != dec_bit) ? 1 : 0;
        total++;
        errors += err;

        if (bit_in_block < TAIL_START)
        { core_bits++;  core_errors += err; }
        else
        { tail_bits++;  tail_errors += err; }

        bit_in_block++;
        if (bit_in_block == SYMBOLS_PER_BLOCK) bit_in_block = 0;
    }

    fclose(fp_ref);
    fclose(fp_dec);

    /* ---------- BER Report ------------------------------------------------- */
    printf("\n");
    printf("+=======================================================+\n");
    printf("|        VITERBI DECODER  --  BER REPORT               |\n");
    printf("|=======================================================|\n");
    printf("| Decoder config                                        |\n");
    printf("|   Rate            : 1/2                               |\n");
    printf("|   Constraint K    : %d                                 |\n", ENC_K);
    printf("|   g0 / g1         : 171 / 133  (octal)               |\n");
    printf("|   Block size      : %d symbols  (%d decoded bits)    |\n",
           SYMBOLS_PER_BLOCK, SYMBOLS_PER_BLOCK);
    printf("|   Blocks tested   : %d                             |\n", NUM_BLOCKS);
    printf("|=======================================================|\n");
    printf("| OVERALL RESULTS                                       |\n");
    printf("|   Total bits tested : %-6ld                          |\n", total);
    printf("|   Correct bits      : %-6ld                          |\n", total - errors);
    printf("|   Errors            : %-6ld                          |\n", errors);
    printf("|   Bit Error Rate    : %-.6f                      |\n",
           (total > 0) ? (double)errors / (double)total : 0.0);
    printf("|   Accuracy          : %-.2f%%                       |\n",
           (total > 0) ? 100.0*(double)(total-errors)/(double)total : 0.0);
    printf("|=======================================================|\n");
    printf("| CORE BITS  (positions 0-%d per block)                 |\n",
           TAIL_START - 1);
    printf("|   Bits tested  : %-6ld                               |\n", core_bits);
    printf("|   Errors       : %-6ld                               |\n", core_errors);
    printf("|   BER          : %-.6f                           |\n",
           (core_bits > 0) ? (double)core_errors / (double)core_bits : 0.0);
    printf("|=======================================================|\n");
    printf("| TAIL BITS  (positions %d-15 per block)                |\n", TAIL_START);
    printf("|   Bits tested  : %-6ld                               |\n", tail_bits);
    printf("|   Errors       : %-6ld                               |\n", tail_errors);
    printf("|   BER          : %-.6f                           |\n",
           (tail_bits > 0) ? (double)tail_errors / (double)tail_bits : 0.0);
    printf("|=======================================================|\n");

    /* --- First-error block scan (show up to 5 bad blocks) --------------- */
    {
        FILE *fp_r2 = fopen(FILE_REFERENCE, "r");
        FILE *fp_d2 = fopen(FILE_DECODED,   "r");
        if (fp_r2 && fp_d2)
        {
            int shown = 0, MAX_SHOW = 5;
            printf("| FIRST BAD BLOCKS (max %d)                             |\n",
                   MAX_SHOW);

            for (int blk = 0; blk < NUM_BLOCKS && shown < MAX_SHOW; blk++)
            {
                int blk_errs = 0;
                for (int b = 0; b < SYMBOLS_PER_BLOCK; b++)
                {
                    int r, d;
                    if (fscanf(fp_r2, "%d", &r) != 1) goto scan_done;
                    if (fscanf(fp_d2, "%d", &d) != 1) goto scan_done;
                    if (r != d) blk_errs++;
                }
                if (blk_errs > 0)
                {
                    printf("|   Block %4d : %2d error(s)                          |\n",
                           blk, blk_errs);
                    shown++;
                }
            }
            scan_done:
            if (shown == 0)
                printf("|   No block errors -- perfect decode!                |\n");
        }
        if (fp_r2) fclose(fp_r2);
        if (fp_d2) fclose(fp_d2);
    }

    printf("+=======================================================+\n\n");

    /* Tail advisory */
    if (tail_errors > 0)
    {
        printf("[NOTE] Tail-region errors detected (%ld errors).\n"
               "       The last %d bits of each block have fewer future\n"
               "       observations available to the traceback path.\n"
               "       To eliminate these, append K-1=%d zero (flush) bits\n"
               "       to each encoder block and expand the decoder to\n"
               "       process %d symbols per call.\n\n",
               tail_errors, ENC_K - 1, ENC_K - 1,
               SYMBOLS_PER_BLOCK + ENC_K - 1);
    }

    return (int)errors;
}

/* ============================================================================
 * main()
 * ============================================================================ */
int main(void)
{
    /* Static arrays -- avoids stack overflow, no dynamic allocation */
    static int input_bits  [TEST_BITS];
    static int encoded_bits[TEST_BITS * ENC_RATE_DENOM];

    printf("+========================================================+\n");
    printf("|     VITERBI DECODER TESTBENCH  --  Vitis HLS           |\n");
    printf("|  Rate 1/2  |  K=7  |  g0=171oct  |  g1=133oct         |\n");
    printf("|  Block: %3d symbols  |  Test: %5d bits               |\n",
           SYMBOLS_PER_BLOCK, TEST_BITS);
    printf("+========================================================+\n\n");

    /* STEPS 1-3 : Generate test vectors and write files */
    if (generate_test_vectors(input_bits, encoded_bits) != 0)
    {
        printf("[FATAL] Test vector generation failed.\n");
        return 1;
    }
    printf("\n");

    /* STEPS 4-6 : Run decoder and save output */
    if (run_decoder() != 0)
    {
        printf("[FATAL] Decoder run failed.\n");
        return 1;
    }
    printf("\n");

    /* STEP 7 : Compare and report */
    int errors = compare_results();
    if (errors < 0)
    {
        printf("[FATAL] Result comparison failed.\n");
        return 1;
    }

    /* Exit 0 = pass (perfect decode), 1 = one or more bit errors */
    return (errors == 0) ? 0 : 1;
}