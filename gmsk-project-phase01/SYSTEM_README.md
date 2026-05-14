# GMSK Packet Communication System with CSV Interface

Complete implementation of a GMSK modulation system with convolutional coding, packet structure, and CSV input/output for AXI4-Stream data.

## System Overview

```
CSV Input → Packet Builder → Conv Encoder → GMSK Modulator → Channel ────────────────────
                                                                                         ↓
CSV Output ← Byte Conversion ← Viterbi Decoder ← Payload Extract ← Preamble Detect ← GMSK Demodulator
```

## File Structure

### Core Communication Blocks
- **convEncoder.m** - Rate 1/2 convolutional encoder (K=7)
- **ViterbiDecoder_corrected.m** - Soft-decision Viterbi decoder
- **GaussianFilter.m** - Gaussian pulse shaping filter
- **GmskMapper.m** - GMSK modulator with phase accumulation
- **GmskDemapper.m** - Phase detection and unwrapping
- **RxDemodulator_corrected.m** - Complete demodulator with LLR output

### Packet Structure
- **Waveform.m** - Defines packet structure with preamble and training sequences

### Packet Processing
- **build_packet.m** - Constructs packet from payload bytes
- **extract_payload.m** - Extracts payload from received burst
- **detect_preamble.m** - Correlation-based preamble detection

### CSV Interface
- **read_axi_stream_csv.m** - Reads AXI4-Stream format CSV
- **write_axi_stream_csv.m** - Writes AXI4-Stream format CSV

### Test Scripts
- **test_complete_system.m** - End-to-end test with CSV I/O
- **test_gmsk_conv_coding.m** - Basic modulation test

## Packet Structure

The Waveform (waveformId=0) defines the following structure:

```
Total Burst: 624 bits
├─ Preamble: 48 bits (for synchronization)
├─ Payload Chunk 1: 136 bits (1/4 of 544 encoded bits)
├─ Training Seq 1: 8 bits (1/4 of 32 training bits)
├─ Payload Chunk 2: 136 bits
├─ Training Seq 2: 8 bits
├─ Payload Chunk 3: 136 bits
├─ Training Seq 3: 8 bits
├─ Payload Chunk 4: 136 bits
└─ Training Seq 4: 8 bits

Payload: 34 bytes (272 bits) → Conv Encoded → 544 bits (rate 1/2)
```

### Key Parameters
- **Information payload**: 34 bytes (272 bits)
- **Encoded payload**: 544 bits (rate 1/2 coding)
- **Preamble**: 48 bits (known sequence for detection)
- **Training sequences**: 4 × 8 = 32 bits (interleaved for channel estimation)
- **Total burst**: 624 bits

## CSV Format (AXI4-Stream)

### Input Format
```
TDATA,TKEEP,TLAST
9B553F84,f,0
0789DC7F,f,0
CA04CA04,3,1
```

- **TDATA**: 32-bit word in hexadecimal (8 hex digits)
- **TKEEP**: Byte enable mask in hex (f = all 4 bytes valid, 3 = upper 2 bytes valid)
- **TLAST**: End of frame flag (1 on last word)

### Byte Ordering
- TDATA stores bytes in big-endian format: `[B3 B2 B1 B0]` where B3 is MSB
- TKEEP bit mapping: bit 0 → B0, bit 1 → B1, bit 2 → B2, bit 3 → B3

## Usage Example

### Basic Usage

```matlab
%% 1. Read input CSV
csvData = read_axi_stream_csv('input_data.csv');
payloadBytes = csvData.bytes;

%% 2. Setup system
waveform = Waveform('waveformId', 0);
encoder = convEncoder('constraintLength', 7, 'generatorPolynomials', [171 133]);
gaussFilt = GaussianFilter('BT', 0.35, 'SPS', 4);
gmskMod = GmskMapper();

rxDemod = RxDemodulator('llrType', "soft_llr", 'samplesPerSymbol', 4);
vitDecoder = ViterbiDecoder('tracebackLen', 35, 'inputType', "soft_llr");

%% 3. Transmit
burstBits = build_packet(payloadBytes, waveform, encoder);
filteredBits = gaussFilt(burstBits);
txSignal = gmskMod(filteredBits);

%% 4. Channel (add noise)
rxSignal = txSignal + noise;  % Add AWGN

%% 5. Receive
rxDemod.nVar = noisePower * 4;  % Set noise variance
llrs = rxDemod(rxSignal);
rxBitsHard = uint8(llrs > 0);

%% 6. Detect preamble
[preambleIdx, corrPeak] = detect_preamble(rxBitsHard, waveform.prmbSeq, 0.6);

%% 7. Extract and decode payload
rxBurst = rxBitsHard(preambleIdx:preambleIdx+waveform.burstBlockLen-1);
payloadEncoded = extract_payload(rxBurst, waveform);
decodedBits = vitDecoder(payloadEncoded);

%% 8. Write output CSV
decodedBytes = bits_to_bytes(decodedBits);  % Convert bits to bytes
write_axi_stream_csv('output_data.csv', decodedBytes);
```

### Complete System Test

```matlab
% Run the complete end-to-end test
test_complete_system
```

This will:
1. Create an example input CSV file
2. Read the data
3. Build and transmit packets
4. Add channel noise
5. Receive and detect preamble
6. Extract and decode payload
7. Write output CSV
8. Display diagnostic plots and error statistics

## Key Parameters to Tune

### SNR Control
```matlab
EbN0_dB = 6;  % Higher = less noise, better BER
```

### Preamble Detection
```matlab
PREAMBLE_THRESHOLD = 0.6;  % Lower = more sensitive, more false alarms
```

### Viterbi Decoder
```matlab
vitDecoder.softBitWidth = 3;    % 3-5 bits (higher = better but slower)
vitDecoder.llrClip = 2.5;       % LLR clipping range
vitDecoder.tracebackLen = 35;   % Decoding delay
```

### Noise Variance (Critical!)
```matlab
rxDemod.nVar = noisePower * SPS;  % Must scale by samples-per-symbol
```

## Expected Performance

| Eb/N0 (dB) | Expected BER | Comments |
|------------|--------------|----------|
| 3 dB | ~0.05-0.1 | Marginal |
| 10 dB | ~0.001-0.01 | Usable |
| 30 dB | ~0.0001 | Excellent |


## Testing

Run the test scripts to verify operation:

```matlab

% Complete system test (with packets and CSV)
test_complete_system
```

Code will display:
- Bit/byte error rates
- Diagnostic plots
- Correlation results
- Signal characteristics
