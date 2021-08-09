% Generation, representation and playback of  STEREO signals

Fs = 1600; Ts = 1 / Fs; % Sampling freq, period
time = 0:Ts:0.1; % Define time vector (0.1 second duration)

%Signal computation
xLeft = cos(2*pi*250*time)'; % left channel
xRight = cos(2*pi*450*time)'; % right channel
x = [xLeft xRight]; % compose STEREO signal

%Plot X

figure;
subplot(2,1,1); plot(time,x(:,1)); xlabel("Time (sec)"); title("Left channel");
subplot(2,1,2); plot(time,x(:,2)); xlabel("Time (sec)"); title("Left channel");
sound(x,Fs);