clc
clear 
close all;
%% 

tehran = imread("./../Data/TEHRAN.jpg");
tehran = rgb2gray(tehran);
tehran = im2double(tehran);

figure()
imshow(tehran);
title("Tehran fullscale");

% Wavelet transform
[c, s] = wavedec2(tehran, 4, 'db2');

preserve_thresh = [20, 10, 1, 0.5]/100;

figure()

for idx = 1:length(preserve_thresh)
    %find thresh magnitude
    sorted_mag = sort(abs(c(:)),'descend');
    thresh_idx = floor(length(sorted_mag)*preserve_thresh(idx));
    thresh_mag = sorted_mag(thresh_idx);
    %remove data
    preserve_c = c .*(abs(c)>thresh_mag);

    reconstructed_img = waverec2(preserve_c, s, 'db2');
   
    subplot(2,2,idx);
    imshow(reconstructed_img);
    title(sprintf("%.1f%% coefficient retained",preserve_thresh(idx)*100))

    psnr_eval = psnr(reconstructed_img, tehran);
    ssim_eval = ssim(reconstructed_img, tehran);
    fprintf("%.1f%%: psnr=%f , ssim=%f\n",preserve_thresh(idx)*100, ...
                psnr_eval,ssim_eval);

end


