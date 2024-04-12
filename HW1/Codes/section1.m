clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% Define the signal
x = zeros(1000,1);
x(500)=1;
stem (x);
%% Calculate and display 3D Wavelet of the impulse signal 
figure()
cwt(x,1:50,'haar','3Dplot');
