# Fading Channel GMSK SNR vs BER Simulation

This directory contains the simulation scripts and modules for computing the Bit Error Rate (BER) across various Signal-to-Noise Ratios (SNR) for a GMSK-based communication transceiver system. 

The primary focus of this project is to simulate and plot the BER curve over a **real-world fading channel** (like Rayleigh fading or Hilly Terrain multipath channels) **without adding equalization** at the receiver. This helps establish a baseline understanding of how channel multipath and fading naturally degrade the GMSK signal reception prior to any advanced equalization techniques.

## Files Overview

* **Main Simulation Scripts:**
  * `rayleigh_ber_vs_snr.m`: The main script that simulates the physical layer loop across different SNRs over a Rayleigh fading channel to compute the Bit Error Rate (BER) and plot the results.
  * `ideal_snr_vs_ber.m`: Script for ideal AWGN conditions, kept likely for baseline comparison.
  * `tx_rx_check.m`: Utility script to quickly verify the basic functionality of the transmitter (TX) and receiver (RX) chain.

* **Channel Models:**
  * `hilly_terrain.m`: Defines a real-world multipath channel model (Hilly Terrain), introducing delay spreads and fading.

* **Core Baseband Modules:**
  * `build_packet.m`: Prepares and constructs the payload data into the complete burst format (adds preambles, training sequences etc).
  * `convEncoder.m` & `viterbi_soft_decoder.m`: Convolutional Encoder (TX) and Viterbi Soft Decoder (RX) for channel coding.
  * `GaussianFilter.m`: Applies Gaussian pulse shaping filtering to the digital signal.
  * `GmskMapper.m` & `GmskDemapper.m`: GMSK Modulator/Mapper and Demapper respectively.
  * `detect_preamble.m`: Computes correlation to detect the burst preamble in the receiving stream.
  * `extract_payload.m`: Isolates the payload phase for decoding based on the waveform structure.
  * `RxDemodulator.m`: Encapsulates the complete baseband receiver demodulation process.
  * `Waveform.m`: Constructs the base structure and calculates symbol counts for bursts/packets.

* **Experimental Equalization Scripts (Not actively used in base simulation):**
  * `lms_equalizer_train.m` & `mathwork_lms_equalization.m`: Scripts exploring LMS (Least Mean Squares) equalization (though the main objective of this directory's simulations is to observe performance without equalization).

* **Helper / Data Files:**
  * `read_axi_stream_csv.m` & `write_axi_stream_csv.m`: Utilities for reading/writing bitstream/bytes from/to CSV files.
  * `rx_data.csv` & `tx_data.csv`: Sample CSV files acting as the packet content payload input/output.
