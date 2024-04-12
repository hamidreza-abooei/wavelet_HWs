clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% Define the signal
x = zeros(1000,1);
x(250:end)=1;
stem (x);
%% Calculate and display Wavelet of the step signal 
wt = cwt(x,1:100,'haar');
figure()
subplot(5,1,1)
stem(wt(100,:))
title("haar scale=100")

subplot(5,1,2)
stem(wt(30,:))
title("haar scale=30")

subplot(5,1,3)
stem(wt(20,:))
title("haar scale=20")

subplot(5,1,4)
stem(wt(10,:))
title("haar scale=10")

subplot(5,1,5)
stem(wt(2,:))
title("haar scale=2")

figure('name', 'haar100', 'NumberTitle', 'off')
cwt(x,1:100,'haar','plot');
title('haar100')

figure('name', 'DB4', 'NumberTitle', 'off')
cwt(x,1:100,'db4','plot');
title('DB4')

figure('name', 'Sym8', 'NumberTitle', 'off')
cwt(x,1:100,'sym8','plot');
title('Sym8')

figure('name', 'morl', 'NumberTitle', 'off')
cwt(x,1:100,'morl','plot');
title('morl')

figure('name', 'mexh', 'NumberTitle', 'off')
cwt(x,1:100,'mexh','plot');
title('mexh')

figure('name', 'bior5.5', 'NumberTitle', 'off')
cwt(x,1:100,'bior5.5','plot');
title('bior5.5')

