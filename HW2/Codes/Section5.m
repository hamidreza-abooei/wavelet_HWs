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

qrsoneample = ecgsig(4560:4810);
figure()
plot(qrsoneample)

wname = 'sym6';
[cA,cD] = dwt(ecgsig,wname);
[pks,locs] = findpeaks(cA,'MinPeakDistance',100);

figure()
subplot(2,1,1)
plot(cA)
hold on
scatter(locs,pks)
subplot(2,1,2)
plot(cD)

[c,l] = wavedec(ecgsig,3,wname);
approx = appcoef(c,l,wname);
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);
[pks,locs] = findpeaks(approx);

figure()
subplot(4,1,1)
plot(approx)
hold on
scatter(locs,pks)
title('Approximation Coefficients')
subplot(4,1,2)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(4,1,3)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(4,1,4)
plot(cd1)
title('Level 1 Detail Coefficients')



