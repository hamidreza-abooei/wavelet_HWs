clc;
clear;
close all;
% Author: Hamidreza Abooei
%% Reading the EEG signal and initiallization
load("./../Data/coefficent.mat");
wv = 'db2';
l(1)=[];
approx = appcoef(c,l,wv);
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1 2 3 4]);
x = waverec(c,l,wv);

%% Show signals with all freq bands
figure()
subplot(6,1,1)
plot(x)
title('Reconstructed Signal using below rythems')
xlim([0,length(x)])
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



%% Removing alpha and beta bands
c1 = c;
c1(l(1)+l(2)+1:l(1)+l(2)+l(3)+l(4))=0;  % Removing alpha and beta


approx = appcoef(c1,l,wv);
[cd1,cd2,cd3,cd4] = detcoef(c1,l,[1 2 3 4]);
x1 = waverec(c1,l,wv);

%% Show signals with all freq bands
figure()
subplot(6,1,1)
plot(x1)
title('Reconstructed Signal using below rythems')
xlim([0,length(x1)])
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

%% Removing delta and alpha bands

c2 = c;
c2(1:l(1))=0;  % Removing delta
c2(l(1)+l(2)+l(3)+l(4)+1:l(1)+l(2)+l(3)+l(4)+l(5))=0;  % Removing gamma


approx = appcoef(c2,l,wv);
[cd1,cd2,cd3,cd4] = detcoef(c2,l,[1 2 3 4]);
x2 = waverec(c2,l,wv);

%% Show signals with all freq bands
figure()
subplot(6,1,1)
plot(x2)
title('Reconstructed Signal using below rythems')
xlim([0,length(x2)])
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

