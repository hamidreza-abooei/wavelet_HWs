clc
clear
close all;
% Author Hamidreza Abooei
%%
% load("./../Data/EEGP300.mat");
load("./../Data/signalp300.mat");

fs = 240; %Hz
% data = signal(:,1); % Selecting the first channel of our signal.
data = c;
%% 2 level wavelet decomposition
wv = 'db4';
[c,l] = wavedec(data,2,wv);
approx = appcoef(c,l,wv);
[cd1,cd2] = detcoef(c,l,[1 2]);

figure()
subplot(4,1,1)
plot(data)
title("Original Signal")
subplot(4,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(4,1,3)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(4,1,4)
plot(cd1)
title('Level 1 Detail Coefficients')


%% 3 level wavelet decomposition
wv = 'db4';
[c,l] = wavedec(data,3,wv);
approx = appcoef(c,l,wv);
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

figure()
subplot(5,1,1)
plot(data)
title("Original Signal")
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')

%% 4 level -approximation wavelet decomposition
wv = 'db4';
[c,l] = wavedec(data,4,wv);
approx = appcoef(c,l,wv);
% [cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

figure()
subplot(2,1,1)
plot(data)
title("Original Signal")
subplot(2,1,2)
plot(approx)
title('Approximation Coefficients after 4 level decomposition')


