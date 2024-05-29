clc
clear
close all;
% Author: Hamidreza Abooei
%% Read dataset and select channels
load("./../Data/EEGMI.mat");
data1 = cnt(:,5);
data2 = cnt(:,10);
data3 = cnt(:,15);
fs = 100;

%% Continous Wavelet transform on 31min data
figure()
cwt(data1,fs);
title("Magnetude Scalogram for channel 5 | fs= 100 Hz")
figure()
cwt(data2,fs);
title("Magnetude Scalogram for channel 10 | fs= 100 Hz")
figure()
cwt(data3,fs);
title("Magnetude Scalogram for channel 15 | fs= 100 Hz")

%% Welch PSD
figure()
pwelch(data1);
title("Welch Power Spectral Density Estimate channel 5")
figure()
pwelch(data2);
title("Welch Power Spectral Density Estimate channel 10")
figure()
pwelch(data3);
title("Welch Power Spectral Density Estimate channel 15")

%% cwt on Cue and Motor imagery (2:6) of trail. starting from 0
trail1 = data1(2*fs:6*fs);
figure()
cwt(trail1,[],[],[],fs);
title("Magnetude Scalogram for channel 5 ,trial1 | fs= 100 Hz")

trail2 = data2(2*fs:6*fs);
figure()
cwt(trail2,[],[],[],fs);
title("Magnetude Scalogram for channel 10 ,trial1 | fs= 100 Hz")

trail3 = data3(2*fs:6*fs);
figure()
cwt(trail3,[],[],[],fs);
title("Magnetude Scalogram for channel 15 ,trial1 | fs= 100 Hz")

