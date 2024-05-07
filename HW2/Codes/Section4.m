clc
clear
close all;
% Author: Hamidreza Abooei
%%
load("./../Data/EEGMI.mat");
data1 = cnt(:,5);
data2 = cnt(:,10);
data3 = cnt(:,15);
fs = 100;
figure()
cwt(data1,'bump',fs);
figure()
cwt(data2,'bump',fs);
figure()
cwt(data3,'bump',fs);

figure()
pwelch(data1);