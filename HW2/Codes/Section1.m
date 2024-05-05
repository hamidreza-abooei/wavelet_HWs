clc;
clear;
close all;
% Author: Hamidreza Abooei
%% Reading the EEG signal and initiallization
load("./../Data/EEGSignal.mat");
%% Calculating wavelet with 4 level wavedec
[c,l] = wavedec(signal,4,'db2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1 2 3 4]);
%% Display EEG rythems
subplot(6,1,1)
plot(signal)
title('Original Signal')
xlim([0,length(signal)])
subplot(6,1,2)
plot(approx)
title('delta')
xlim([0,length(approx)])

subplot(6,1,3)
plot(cd4)
title('theta')
xlim([0,length(cd4)])

subplot(6,1,4)
plot(cd3)
title('alpha')
xlim([0,length(cd3)])

subplot(6,1,5)
plot(cd2)
title('beta')
xlim([0,length(cd2)])

subplot(6,1,6)
plot(cd1)
title('gamma')
xlim([0,length(cd1)])
