clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% Define the signal
t= linspace(0,1,100)';
f0 = 1;
x1 = sin(2 * pi * f0 * t);
x2 = x1 + 0.2 * (t >= 0.5);

figure()
plot(t, [x1 x2]);
legend('x1', 'x2');
xlabel('Time');
ylabel('Amplitude');
title('Plot of x1 and x2');

Fs = 100;
Y = fft(x2);
L = length(x2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure()
subplot(3,1,1)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X2(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% Calculate and display Wavelet of the step signal 
% figure('name', 'haar2', 'NumberTitle', 'off')
% cwt(x,1:2,'haar','plot');
% title('haar2')
[swa,swd] = swt(x2,2,'db1');

swa2 = swa(2,:);
swd2 = swd(2,:);

% figure();
subplot(3,1,2)
plot(t,swa2)
title('Level 2 Approximation coefficients')
ylabel("coeff");
subplot(3,1,3)
plot(t,swd2)
title('Level 2 Detail coefficients')
xlabel('time(s)')
ylabel("coeff")