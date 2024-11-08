clc
clear
close all;
% Author Hamidreza Abooei
%% Demo
load mit200
figure
plot(tm,ecgsig)
hold on
plot(tm(ann),ecgsig(ann),'ro')
xlabel('Seconds')
ylabel('Amplitude')
title('Subject - MIT-BIH 200')

%% select a sample qrs complex
t= 4560:4810;
qrsoneample = ecgsig(t);
figure()
plot(t,qrsoneample)
xlabel("time(ms)");
ylabel("Amplitude");
title("A sample qrs complex")

%% Using wavelet transform to be able to detect peaks better
wname = 'sym6';
[cA,cD] = dwt(ecgsig,wname);
[pks,locs] = findpeaks(cA,'MinPeakDistance',100);

figure()
subplot(2,1,1)
plot(cA)
hold on
scatter(locs,pks)
title("Approximation level1 dwt with findPeaks and min peak dist=100")
xlabel("time")
ylabel("Amplitude")
subplot(2,1,2)
plot(cD)
title("Wavelet level1 dwt")
xlabel("time")
ylabel("Amplitude")

%% Using wavedec to apply wavelet trasform 3 level and detect peaks
[c,l] = wavedec(ecgsig,3,wname);
approx = appcoef(c,l,wname);
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
[pks,locs] = findpeaks(approx,'MinPeakDistance',25);

figure()
subplot(4,1,1)
plot(approx)
hold on
scatter(locs,pks)
title('Approximation Coefficients with findPeaks and min peak dist=25')
subplot(4,1,2)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(4,1,3)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(4,1,4)
plot(cd1)
title('Level 1 Detail Coefficients')



