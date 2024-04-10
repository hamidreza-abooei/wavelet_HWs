clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% Define a signal
fs = 100; %Hz
f0 = 2; 
f1 = 5;
t = 0:1/fs:5-3/fs;
x = 1.5*sin(2*pi*f0*t).*t-2.5*cos(2*pi*f1*t).*heaviside(t-2)+rand(1,length(t));

% figure()
% plot(t,x);
% title('Original signal');
% xlabel("time(s)");
% ylabel("Amplitude");

%% Wavelet decomposition with Daubechies family
[cA,cD] = dwt(x,'db2');
figure()
subplot(3,1,1);
plot(x);
title('Original signal');
% xlabel("time");
ylabel("Amplitude");
subplot(3,1,2);
plot(cA);
title('Approximation Decomposition');
% xlabel("time(s)");
ylabel("Amplitude");
subplot(3,1,3);
plot(cD);
title('Detail Decomposition');
% xlabel("time(s)");
ylabel("Amplitude");






