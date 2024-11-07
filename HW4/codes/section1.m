clc
clear
close all;

%% 
golestan = imread("./../Data/Golestan.jpg");
golestan = rgb2gray(golestan);
golestan = im2double(golestan);
figure()
imshow(golestan)
title("Original Grayscale image");


[a,h,v,d] = haart2(golestan,1);
figure()
subplot(2,2,1);
imshow(a)
title("Approximate")
subplot(2,2,2);
imshow(h)
title("Horizontal")
subplot(2,2,3);
imshow(v)
title("Vertical")
subplot(2,2,4);
imshow(d)
title("Diagonal")
tightlayout

%% 


