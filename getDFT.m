function [FFT, Freq] = getDFT(signal, Fs, PLOT)

N = length(signal); % length of signal
FFT = abs(fft(signal)) / N;

if nargin==2 % return the first half of the spectrum:
    FFT = FFT(1:ceil(N/2));
    Freq = (Fs/2) * (1:ceil(N/2)) / ceil(N/2); %define the frequency axis
else
    if(nargin==3)
        % ... or return the whole spectrum
        FFT = fftshift(FFT);
        if mod(N,2)==0 % define the frequency axis:
            Freq = -N/2:N/2-1;
        else
            Freq = -(N-1)/2:(N-1)/2;
        end
        Freq = (Fs/2) * Freq ./ ceil(N/2);
    end
end