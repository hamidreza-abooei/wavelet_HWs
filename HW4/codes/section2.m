clc;
clear;
close all;
%% 

% img = imread("./../Data/cameraman.jpg");
% imgnoisy = imread("./../Data/cameramannoisy.jpg");
img = imread('cameraman.tif');
imgnoisy = imnoise(img,'salt & pepper',0.02);
imgnoisy = imnoise(imgnoisy,'gaussian',0.05);


% grayscale
% img = rgb2gray(img);
% imgnoisy = rgb2gray(imgnoisy);

% Double
img = im2double(img);
imgnoisy = im2double(imgnoisy);

% Show original and noisy images
figure();
subplot(1,2,1);
imshow(img)
title("original Image")
subplot(1,2,2);
imshow(imgnoisy);
title("Noisy Generated Image")

% Gaussian filter
gauss_kernel =  fspecial('gaussian',[3,3],1);
gauss_output = imfilter(imgnoisy,gauss_kernel);

%median filter
median_output = medfilt2(imgnoisy,[3,3]);

% wavelet denoising
wavelet_output = wdenoise2(imgnoisy,3,'wavelet','db4', ...
                           'DenoisingMethod', 'Bayes', ...
                           'ThresholdRule', 'Median');

figure();
subplot(2,2,1);
imshow(imgnoisy)
title("noisy")
subplot(2,2,2);
imshow(gauss_output)
title("gaussian")
subplot(2,2,3);
imshow(median_output)
title("median")
subplot(2,2,4);
imshow(wavelet_output)
title("wavelet")

% Calculate evaluating 

[snr_gauss, mse_gauss] = performance_evaluation(imgnoisy, gauss_output);
[snr_med, mse_med] = performance_evaluation(imgnoisy, median_output);
[snr_wavelet, mse_wavelet] = performance_evaluation(imgnoisy, wavelet_output);


% Show evaluations
fprintf("Gaussian: SNR=%f, MSE=%f\n",snr_gauss,mse_gauss);
fprintf("Median  : SNR=%f, MSE=%f\n",snr_med,mse_med);
fprintf("Wavelet : SNR=%f, MSE=%f\n",snr_wavelet,mse_wavelet);

function [snr_val, mse_val] = performance_evaluation(original, filterd)
    signal_ = sum(original(:).^2);
    noise_ = sum((original(:) - filterd(:)).^2);
    snr_val = 10 * log10(signal_ / noise_);
    mse_val = immse(original, filterd);
end



