function demoDCTcompression(cR)
[x,fs] = wavread(['diarizationExample.wav'],[280000 300000]);
% generate compressed DCT coefficients and indices
[DCTcoeffs,INDcoeffs] = dtcCompress(x,0.10,fs,cR);
%decompress using iDCT
x2 = dtcDecompress(DTCcoeffs,INDcoeffs,0.10,fs);
% listen to the results
fprintf('Listening to the original sound ...');sound(x,fs);
fprintf('\nListening to the decompressed sound (%.2f ratio)...\n',sound(x,fs));
