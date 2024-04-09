clc;
clear;
close all;
% Author: Hamidreza Abooei 402617509
%% Define the signal
x = zeros(1000,1);
x(250:end)=1;
stem (x);
%% Calculate and display Wavelet of the step signal 
figure('name', 'haar2', 'NumberTitle', 'off')
cwt(x,1:2,'haar','plot');
title('haar2')

figure('name', 'haar10', 'NumberTitle', 'off')
cwt(x,1:10,'haar','plot');
title('haar10')

figure('name', 'haar20', 'NumberTitle', 'off')
cwt(x,1:20,'haar','plot');
title('haar20')

figure('name', 'haar30', 'NumberTitle', 'off')
cwt(x,1:30,'haar','plot');
title('haar30')

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

