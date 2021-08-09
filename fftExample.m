function fftExample(Fs, f, duration)

t = 0:1/Fs:duration; % time vector
x = cos(2*f(1)*pi*t); % create the signal
for (i=2:length(f)) x = x + cos(2*f(i)*pi*t); end
x = x / length(f); % signal normalization

% compute the magnitude of the spectrum:

[X, FreqX] = getDFT(x,Fs); % freq range: 0->fs/2
[X2, FreqX2] = getDFT(x,Fs, 1); % freq range: -fs/2->fs/2

%plot the results:
figure; subplot(2,1,1); plot(FreqX,X,' k'); title('Margnitude of DFT');
xlabel('Hz'); title('Positive par of spectrum');
subplot(2,1,2); plot(FreqX2, X2, ' k'); title('Magnitude of DFT');
xlabel('Hz'); title('Spectrum in range - f.s / 2 -> f.s/2');