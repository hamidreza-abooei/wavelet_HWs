clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% load and preview noisbump and noisbloc from wavelet toolbox

load noisbump
load noisbloc

figure()
plot(noisbump);
title("noisbump original signal")

figure()
plot(noisbloc);
title("noisbloc original signal")

%% Wavelet decomposition with Daubechies family 2

[c,l] = wavedec(noisbump,2,'db2');
approx = appcoef(c,l,"db2");
[cd1,cd2] = detcoef(c,l,[1 2]);

figure()
subplot(4,1,1)
plot(noisbump)
title("noisbump original signal")
subplot(4,1,2);
plot(approx)
title("Approximation Coefficients")
subplot(4,1,3);
plot(cd2)
title("Level 2 Detail Coefficients")
subplot(4,1,4);
plot(cd1)
title("Level 1 Detail Coefficients")


[c,l] = wavedec(noisbloc,2,'db2');
approx = appcoef(c,l,"db2");
[cd1,cd2] = detcoef(c,l,[1 2]);

figure()
subplot(4,1,1)
plot(noisbloc)
title("noisbloc original signal")
subplot(4,1,2);
plot(approx)
title("Approximation Coefficients")
subplot(4,1,3);
plot(cd2)
title("Level 2 Detail Coefficients")
subplot(4,1,4);
plot(cd1)
title("Level 1 Detail Coefficients")


%% Define signal 

t = linspace(0,1,1000);
f0 = 10;
sigma = 0.2;
x = sin(2*pi*f0*t)+ sigma *randn(size(t));

[c,l] = wavedec(x,3,'sym4');
approx = appcoef(c,l,"sym4");
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

figure()
subplot(5,1,1)
plot(x)
title("our original signal")
subplot(5,1,2);
plot(approx)
title("Approximation 3 Coefficients")
subplot(5,1,3);
plot(cd3)
title("Level 3 Detail Coefficients")
subplot(5,1,4);
plot(cd2)
title("Level 2 Detail Coefficients")
subplot(5,1,5);
plot(cd1)
title("Level 1 Detail Coefficients")

figure()
subplot(2,1,1)
plot(approx);
title("Approximates 3 Coefficients")
subplot(2,1,2);
plot(cd2)
title("Level 2 Detail Coefficients")



