function S = read_axi_stream_csv(filename)
% READ_AXI_STREAM_CSV  Load AXI4-Stream words from CSV and unpack bytes/bits.
% Expected header: TDATA,TKEEP,TLAST
%   TDATA : 32-bit word in hex (e.g., 9B553F84)
%   TKEEP : hex mask of valid bytes (e.g., f, 3)  [LSB -> lowest byte]
%   TLAST : 0/1 (end of frame)
%
% Returns struct S with:
%   .words   : uint32 [N x 1]      raw words
%   .tkeep   : uint8  [N x 1]      per-row keep masks
%   .tlast   : logical [N x 1]     per-row last flags
%   .bytes   : uint8  [M x 1]      all valid bytes concatenated
%   .bits    : logical [8*M x 1]   bits (MSB-first) for all bytes
%   .frames  : 1xF cell, each cell is uint8 vector of one frame's bytes

    T = readtable(filename, 'TextType', 'string');
    mustHave = ["TDATA","TKEEP","TLAST"];
    if any(~ismember(mustHave, string(T.Properties.VariableNames)))
        error('CSV must have header: TDATA,TKEEP,TLAST');
    end

    n = height(T);
    words = zeros(n,1,'uint32');
    tkeep = zeros(n,1,'uint8');
    tlast = false(n,1);

    % Helpers
    hex2u32 = @(s) uint32(hex2dec(strip(lower(s))));
    hex2u8  = @(s) uint8 (hex2dec(strip(lower(s))));

    % Parse rows
    for i = 1:n
        words(i) = hex2u32(T.TDATA(i));
        tkeep(i) = hex2u8 (T.TKEEP(i));
        tlast(i) = logical(str2double(string(T.TLAST(i))));
    end

    % Unpack bytes with TKEEP (LSB bit -> lowest byte)
    allBytes = uint8([]);
    frames   = {};
    curFrame = uint8([]);

    for i = 1:n
        w = words(i);

        % Byte lanes: bit order in TKEEP [0,1,2,3] maps to bytes [b0,b1,b2,b3]
        % where b0 is LSB byte of the word
        b0 = uint8(bitand(w, uint32(255)));
        b1 = uint8(bitand(bitshift(w,-8), uint32(255)));
        b2 = uint8(bitand(bitshift(w,-16), uint32(255)));
        b3 = uint8(bitand(bitshift(w,-24), uint32(255)));
        
        % Store in byte order (MSB first for transmission)
        lane = [b3, b2, b1, b0];

        % Keep mask bits [1..4] correspond to bytes [b0..b3]
        kb = [bitget(tkeep(i), 4), bitget(tkeep(i), 3), ...
              bitget(tkeep(i), 2), bitget(tkeep(i), 1)] == 1;
        valid = lane(kb);

        % Append
        allBytes = [allBytes, valid];          %#ok<AGROW>
        curFrame = [curFrame, valid];          %#ok<AGROW>

        % TLAST -> push frame
        if tlast(i)
            frames{end+1} = curFrame; %#ok<AGROW>
            curFrame = uint8([]);
        end
    end

    % Convert bytes to bits (MSB-first per byte)
    if ~isempty(allBytes)
        bits = false(8*numel(allBytes),1);
        k = 1;
        for b = allBytes
            % Extract bits MSB first
            bb = logical(bitget(uint8(b), 8:-1:1));
            bits(k:k+7) = bb;
            k = k + 8;
        end
    else
        bits = false(0,1);
    end

    % Pack outputs
    S = struct();
    S.words  = words;
    S.tkeep  = tkeep;
    S.tlast  = tlast;
    S.bytes  = allBytes(:);
    S.bits   = bits;
    S.frames = frames;
end
