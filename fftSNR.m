function fftSNR(Fs,f, duration,SNR)
t = 0:1/Fs:duration; %time vector
%signal definition
x = cos(2*f(1)*pi*t); % a clean signal
for (i=2:length(f)) x = x + cos(2*f(i)*pi*t); end
x = x /length(f); % signal normalization
y = awgn(x, SNR, 'measured'); % b noisy signal

% compute the magnitude of the spectrum of x: and y:
[X, FreqX] = getDFT(x,Fs); [Y, FreqY] = getDFT(y,Fs);

%plot the results
figure(); subplot(2,1,1); plot(FreqX,log10(X),'k');
axis([1 max(FreqX) -5 0]);
title('Log-magnitude of the Spectrum of the original (clean) signal');
xlabel('Frequency (Hz)');
subplot(2,1,2); plot(FreqY,log10(Y),'k');
axis([1 max(FreqX) -5 0]);
title('Log-magnitude of the Spectrum of the noisy signal');
xlabel('Frequency (Hz)');
