csvInputFile = 'tx_multipacket_data.csv';

% Create example data with enough for multiple packets (34 bytes per packet)
% Let's create ~100 bytes (approximately 3 packets)
fid = fopen(csvInputFile, 'w');
fprintf(fid, 'TDATA,TKEEP,TLAST\n');

% Packet 1 data (32 bytes)
fprintf(fid, '9B553F84,f,0\n');
fprintf(fid, '0789DC7F,f,0\n');
fprintf(fid, 'A5D96C37,f,0\n');
fprintf(fid, '5C785D9D,f,0\n');
fprintf(fid, 'AE136D2E,f,0\n');
fprintf(fid, '6DEE555D,f,0\n');
fprintf(fid, '54BDB425,f,0\n');
fprintf(fid, '906722C9,f,0\n');

% Packet 2 data (32 bytes)
fprintf(fid, 'DEADBEEF,f,0\n');
fprintf(fid, 'CAFEBABE,f,0\n');
fprintf(fid, '12345678,f,0\n');
fprintf(fid, '9ABCDEF0,f,0\n');
fprintf(fid, 'FEDCBA98,f,0\n');
fprintf(fid, '76543210,f,0\n');
fprintf(fid, 'AAAABBBB,f,0\n');
fprintf(fid, 'CCCCDDDD,f,0\n');

% Packet 3 data (32 bytes)
fprintf(fid, '11111111,f,0\n');
fprintf(fid, '22222222,f,0\n');
fprintf(fid, '33333333,f,0\n');
fprintf(fid, '44444444,f,0\n');
fprintf(fid, '55555555,f,0\n');
fprintf(fid, '66666666,f,0\n');
fprintf(fid, '77777777,f,0\n');
fprintf(fid, '88888888,f,0\n');

% Partial packet 4 (10 bytes)
fprintf(fid, 'FFFEFDFC,f,0\n');
fprintf(fid, 'FBFAF9F8,f,0\n');
fprintf(fid, 'F7F6F5F4,3,1\n');  % Only 2 bytes valid (TKEEP=3 means upper 2 bytes)

fclose(fid);
fprintf('=== Created multi-packet input CSV: %s ===\n\n', csvInputFile);

