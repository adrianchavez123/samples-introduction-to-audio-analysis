
Fs = 1600; Ts = 1 /Fs ; %sampling frequency, sampling period
time = 0:Ts:0.1; % defining when sampling occurs

Freqs = [250 550 900]; %these are the frequencies of the signal

Xs = zeros(length(Freqs),length(time));

for i=1: length(Freqs) % create one audio signal (tone) per frequency
    Xs(i,:) = cos(2*pi*Freqs(i)*time);  
end


x = sum(Xs); %the final sum of tones
x = x ./ max(abs(x)); %normalize x

figure; plot(time,x); axis([0 time(end) -1 1]); %plot x
xlabel("Time (sec)"); ylabel("Signal Amp");
title("A sample audio signal");