function decoded_bits = viterbi_soft_decoder(llr, TB_LEN)

    % ================================
    % PARAMETERS
    % ================================
    K = 7;
    NUM_STATES = 2^(K-1);

    % Generator polynomials (binary)
    G0 = [1 1 1 1 0 0 1]; % 0x79
    G1 = [1 0 1 1 0 1 1]; % 0x5B

    % ================================
    % INPUT PROCESSING
    % ================================
    num_symbols = length(llr)/2;
    rx = reshape(llr, 2, []).';   % [N x 2]

    % ================================
    % INITIALIZATION
    % ================================
    pm = inf(NUM_STATES,1);
    pm(1) = 0;  % start from state 0

    survivor = zeros(num_symbols, NUM_STATES);

    decoded_bits = zeros(num_symbols,1);

    % ================================
    % TRELLIS PROCESSING
    % ================================
    for t = 1:num_symbols

        pm_next = inf(NUM_STATES,1);

        for ns = 0:NUM_STATES-1

            % Extract input bit from next state
            in_bit = bitget(ns,6);   % MSB

            % Predecessors
            ns_lo5 = bitand(ns,31);  % lower 5 bits

            pred0 = bitshift(ns_lo5,1);
            pred1 = pred0 + 1;

            % Expected outputs
            exp0 = encoder_output(pred0, in_bit, G0, G1);
            exp1 = encoder_output(pred1, in_bit, G0, G1);

            % Branch metrics (soft)
            bm0 = soft_metric(rx(t,:), exp0);
            bm1 = soft_metric(rx(t,:), exp1);

            % Path metrics
            total0 = pm(pred0+1) + bm0;
            total1 = pm(pred1+1) + bm1;

            % ACS
            if total0 <= total1
                pm_next(ns+1) = total0;
                survivor(t,ns+1) = 0;
            else
                pm_next(ns+1) = total1;
                survivor(t,ns+1) = 1;
            end

        end

        pm = pm_next;

        % ================================
        % SLIDING TRACEBACK
        % ================================
        if t >= TB_LEN
            decoded_bits(t-TB_LEN+1) = traceback(survivor, pm, t, TB_LEN);
        end
        
        
    end 
    % ================================
    % FINAL TRACEBACK (FLUSH LAST BITS)
    % ================================

    % First valid decoded index
    start_idx = num_symbols - TB_LEN + 1;

    % Fill remaining TB_LEN-1 bits
    for i = 1:TB_LEN-1
        depth = TB_LEN - i;
        decoded_bits(start_idx + i) = traceback(survivor, pm, num_symbols, depth);
    end

    % Final output is FULL length
    decoded_bits = decoded_bits(1:num_symbols);
    
end

function sym = encoder_output(state, in_bit, G0, G1)

    % Build shift register (7 bits)
    reg = [in_bit, bitget(state,6:-1:1)];

    % Compute outputs
    out0 = mod(sum(reg .* G0),2);
    out1 = mod(sum(reg .* G1),2);

    sym = [out0 out1];

end

function m = soft_metric(llr, bits)

    % Convert bits to bipolar: 0 → -1, 1 → +1
    % This matches the LLR convention where positive LLR = bit 1
    b = 2*bits - 1;

    % Branch metric: negative correlation (minimize for best match)
    % When expected bit matches LLR sign, b*llr > 0, so m < 0 (good)
    % When expected bit differs from LLR sign, b*llr < 0, so m > 0 (bad)
    m = -(b(1)*llr(1) + b(2)*llr(2));

end

function bit = traceback(survivor, pm, t, TB_LEN)

    % Find best final state
    [~, state] = min(pm);
    state = state - 1; % zero-based

    % Walk backwards through the trellis for TB_LEN-1 steps
    % We trace back TB_LEN-1 steps because:
    % - After k steps back from time t, we're at state(t-k)
    % - The input bit at time (t-k+1) is the MSB of state(t-k+1)
    % - So to get the input at time (t-TB_LEN+1), we need state(t-TB_LEN+1)
    % - Which requires TB_LEN-1 traceback steps
    for k = 0:TB_LEN-2
        surv = survivor(t-k, state+1);
        
        % Reconstruct previous state
        % The survivor stores the LSB of the predecessor state
        % prev_state = ((next_state & 31) << 1) | survivor_bit
        state = bitor(bitshift(bitand(state, 31), 1), surv);
    end

    % Output decoded bit: the MSB of the current state
    % This is the input bit that was used at time (t-TB_LEN+1)
    bit = bitget(state, 6);

end
